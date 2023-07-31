COPY
  title(title, internal_title, company)
FROM
  '/usr/src/app/csv/title/title.csv'
DELIMITER '|'
CSV NULL AS 'NULL';
