CREATE TABLE skill (
  name          TEXT,
  type          TEXT REFERENCES skill_type(name),
  detail        TEXT,
  rank_in_type  INTEGER,
  featured      BOOLEAN,
  PRIMARY KEY (name, type)
);
