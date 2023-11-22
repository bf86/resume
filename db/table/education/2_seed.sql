COPY
  education(institution,degree,field,honors)
FROM
  '/usr/src/app/csv/education/education.csv'
DELIMITER '|'
CSV NULL AS 'NULL';
