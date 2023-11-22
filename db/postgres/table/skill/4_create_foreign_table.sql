DROP FOREIGN TABLE IF EXISTS skill_production;

CREATE FOREIGN TABLE skill_production (
  name     TEXT,
  type     TEXT
)
SERVER resume_production
OPTIONS (table_name 'skill');
