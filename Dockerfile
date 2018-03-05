FROM node:alpine

RUN apk add --update openssl

COPY . . 

RUN npm install


CMD ["chmod", "+x", "migrate.sh"]



EXPOSE 8080

CMD ["npm", "start"]
