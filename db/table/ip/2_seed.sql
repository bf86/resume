COPY
  ip(ip,organization,hacker,investigate,benign,suspicious)
FROM
  '/usr/src/app/csv/ip/ip.csv'
DELIMITER '|'
CSV HEADER NULL AS '';
