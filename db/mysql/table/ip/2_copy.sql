LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/ip/ip.csv'
INTO TABLE
  ip
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (ip,organization,hacker,investigate,benign,suspicious)
