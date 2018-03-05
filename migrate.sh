#!/bin/sh
if [ -f ./db.json ]; then
    echo "Deleting existing database"
    rm db.json
    echo "Existing database deleted"
fi

if [ -f ./master.zip ]; then
    echo "deleting existing zip"
    rm master.zip
    echo "Existing zip  deleted"
fi


if [ -d blog-posts-master ]; then
    echo "deleting existing posts"
    rm -rf blog-posts-master
    echo "Existing posts  deleted"
fi



echo "downloading all posts from github repo"
wget --no-check-certificate https://github.com/Snazzyham/blog-posts/archive/master.zip

echo "unzipping posts"
unzip master.zip


echo "migrating all markdown files to json"
node scrape.js blog-posts-master/*.md 

