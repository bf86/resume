ALTER TABLE skill
  ADD CONSTRAINT fk_skill_type FOREIGN KEY (type) REFERENCES skill_type (name);
