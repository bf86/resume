DROP FOREIGN TABLE IF EXISTS project_production;

CREATE FOREIGN TABLE project_production (
  name                     TEXT,
  description              TEXT,
  role                     TEXT,
  organization             TEXT,
  aprox_num_collaborators  INTEGER
)
SERVER resume_production
OPTIONS (table_name 'project');
