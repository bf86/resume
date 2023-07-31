DROP TABLE IF EXISTS project;

CREATE TABLE project (
  name                     TEXT PRIMARY KEY,
  description              TEXT,
  role                     TEXT,
  organization             TEXT,
  aprox_num_collaborators  INTEGER
);
