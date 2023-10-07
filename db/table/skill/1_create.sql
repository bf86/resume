CREATE TABLE skill (
  name          TEXT,
  type          TEXT REFERENCES skill_type(name),
  detail        TEXT,
  rank_in_type  INTEGER,
  featured      BOOLEAN,
  PRIMARY KEY (name, type)
);

-- ALTER TABLE skill ADD COLUMN detail TEXT;
-- ALTER TABLE skill ADD COLUMN rank_in_type BOOLEAN;
-- ALTER TABLE skill ADD COLUMN featured BOOLEAN;
