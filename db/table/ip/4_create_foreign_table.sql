DROP FOREIGN TABLE IF EXISTS ip_production;

CREATE FOREIGN TABLE ip_production (
  ip            TEXT,
  benign        BOOLEAN,
  suspicious    BOOLEAN,
  data_attempt  BOOLEAN
)
SERVER resume_production
OPTIONS (table_name 'ip');
