LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/recommendation/recommendation.csv'
INTO TABLE
  recommendation
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (source,title,url,transcript);
