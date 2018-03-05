const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();
const cmd = require("node-cmd");

// Set default middlewares (logger, static, cors and no-cache)
server.use(middlewares);

// Add custom routes before JSON Server router
server.get("/migrate", (req, res) => {
  cmd.run("npm run migrate");
  res.send("Migration begun");
});

server.get("/rs", (req, res) => {
  process.exit(0);
});
//router.db.assign(require("require-uncached")("./db.json")).write();
server.use(jsonServer.bodyParser);
server.use((req, res, next) => {
  if (req.method === "POST") {
    req.body.createdAt = Date.now();
  }
  // Continue to JSON Server router
  next();
});

// Use default router
server.use(router);
server.listen(8080, () => {
  console.log("JSON Server is running");
});
