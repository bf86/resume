CREATE TABLE ip (
  ip          TEXT PRIMARY KEY,
  benign      BOOLEAN,
  consumer    BOOLEAN,
  crawler     BOOLEAN,
  suspicious  BOOLEAN,
  hacker      BOOLEAN
);
