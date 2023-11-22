DROP FOREIGN TABLE IF EXISTS skill_type_production;

CREATE FOREIGN TABLE skill_type_production (
  name  TEXT
)
SERVER resume_production
OPTIONS (table_name 'skill_type');
