DROP TABLE IF EXISTS ip;

CREATE TABLE ip (
  ip            TEXT PRIMARY KEY,
  organization  TEXT,
  benign        BOOLEAN,
  investigate   BOOLEAN,
  suspicious    BOOLEAN,
  data_attempt  BOOLEAN
);
