LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/title/title.csv'
INTO TABLE
  title
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (title, internal_title, company);
