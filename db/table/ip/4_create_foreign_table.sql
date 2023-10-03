DROP FOREIGN TABLE IF EXISTS ip_production;

CREATE FOREIGN TABLE ip_production (
  ip            TEXT,
  benign        BOOLEAN,
  consumer      BOOLEAN,
  crawler       BOOLEAN,
  suspicious    BOOLEAN,
  hacker  BOOLEAN
)
SERVER resume_production
OPTIONS (table_name 'ip');
