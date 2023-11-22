LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/education/education.csv'
INTO TABLE
  education
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (institution,degree,field,honors);
