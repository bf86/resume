LOAD DATA LOCAL INFILE
  '/usr/src/app/csv/skill/skill.csv'
INTO TABLE
  skill
CHARACTER SET UTF8
FIELDS
TERMINATED BY '|'
ENCLOSED BY ''
ESCAPED BY '\\'
LINES
TERMINATED BY '\n'
STARTING BY ''
  (name,type,rank_in_type)
