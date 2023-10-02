DROP TABLE IF EXISTS ip;

CREATE TABLE ip (
  ip            TEXT PRIMARY KEY,
  benign        BOOLEAN,
  consumer      BOOLEAN,
  suspicious    BOOLEAN,
  data_attempt  BOOLEAN
);
