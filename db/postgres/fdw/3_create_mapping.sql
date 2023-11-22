CREATE USER MAPPING IF NOT EXISTS FOR zodiac
  SERVER resume_production
  OPTIONS (
    user 'POSTGRES_USER',
    password 'POSTGRES_PASSWORD'
  );
