LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/app/app.csv'
INTO TABLE
  app
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (name,db,api,frontend,webserver,os,role,description);
