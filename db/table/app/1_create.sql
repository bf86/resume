DROP TABLE IF EXISTS app;

CREATE TABLE app (
  name         TEXT PRIMARY KEY,
  database     TEXT,
  api          TEXT,
  frontend     TEXT,
  webserver    TEXT,
  os           TEXT,
  role         TEXT,
  description  TEXT
);
