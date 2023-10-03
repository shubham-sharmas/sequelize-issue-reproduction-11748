const Sequelize = require("sequelize");

const db = new Sequelize({
  dialect: "postgres",
  host: "127.0.0.1",
  port: 5432,
  database: "_11748",
  username: "",
  password: "",
});

module.exports = db;
