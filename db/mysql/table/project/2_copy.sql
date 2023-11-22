LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/project/project.csv'
INTO TABLE
  project
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (name,description,role,organization)
