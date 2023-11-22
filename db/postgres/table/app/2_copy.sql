COPY
  app(name,database,api,frontend,webserver,os,role,description)
FROM
  '/usr/src/app/csv/app/app.csv'
DELIMITER '|'
CSV NULL AS 'NULL';
