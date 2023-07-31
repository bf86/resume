COPY
  project(name,description,role,organization)
FROM
  '/usr/src/app/csv/project/project.csv'
DELIMITER '|'
CSV NULL AS 'NULL';
