CREATE SERVER IF NOT EXISTS resume_production
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'brian86.dev', port '5432', dbname 'resume');
