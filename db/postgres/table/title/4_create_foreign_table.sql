DROP FOREIGN TABLE IF EXISTS title_production;

CREATE FOREIGN TABLE title_production (
  title           TEXT,
  internal_title  TEXT,
  company         TEXT
)
SERVER resume_production
OPTIONS (table_name 'title');
