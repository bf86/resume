DROP TABLE IF EXISTS title;

CREATE TABLE title (
  title           TEXT,
  internal_title  TEXT,
  company         TEXT,
  PRIMARY KEY (title, company)
);
