DROP FOREIGN TABLE IF EXISTS education_production;

CREATE FOREIGN TABLE education_production (
  institution  TEXT,
  degree       TEXT,
  field        TEXT,
  honors       TEXT
)
SERVER resume_production
OPTIONS (table_name 'education');
