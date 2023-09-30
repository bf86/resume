COPY
  ip(ip,organization,data_attempt,investigate,benign,suspicious)
FROM
  '/usr/src/app/csv/ip/ip.csv'
DELIMITER '|'
CSV HEADER NULL AS '';
