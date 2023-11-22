const { Client } = require('pg');

const client = new Client({
  host: process.env.POSTGRES_HOST_PRODUCTION,
  port: process.env.POSTGRES_PORT_PRODUCTION,
  database: process.env.POSTGRES_DB_NAME_PRODUCTION,
  user: process.env.POSTGRES_USER_PRODUCTION,
  password: process.env.POSTGRES_PASSWORD_PRODUCTION,
});

client.connect();

module.exports = client;
