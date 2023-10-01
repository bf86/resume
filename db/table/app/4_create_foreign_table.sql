DROP FOREIGN TABLE IF EXISTS app_production;

CREATE FOREIGN TABLE app_production (
  name         TEXT,
  database     TEXT,
  api          TEXT,
  frontend     TEXT,
  webserver    TEXT,
  os           TEXT,
  role         TEXT,
  description  TEXT
)
SERVER resume_production
OPTIONS (table_name 'app');
