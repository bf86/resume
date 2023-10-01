#!/bin/bash

# Vars
dir="$(dirname "$0")"
fdw_dir="$dir/../fdw"
psql_string="psql -h localhost -d $POSTGRES_DB -U $POSTGRES_USER"


# Foreign server setup
$psql_string < "$fdw_dir/1_create_extension.sql"
$psql_string < "$fdw_dir/2_create_server.sql"

# Generate SQL with password included from env vars
echo "CREATE USER MAPPING IF NOT EXISTS FOR zodiac
  SERVER resume_production
  OPTIONS (
    user '$POSTGRES_USER',
    password '$POSTGRES_PASSWORD'
  );" > $fdw_dir/3_create_mapping.sql
$psql_string < "$fdw_dir/3_create_mapping.sql"

# Regenerate SQL template without env vars
echo "CREATE USER MAPPING IF NOT EXISTS FOR zodiac
  SERVER resume_production
  OPTIONS (
    user 'POSTGRES_USER',
    password 'POSTGRES_PASSWORD'
  );" > $fdw_dir/3_create_mapping.sql
$psql_string < "$fdw_dir/3_create_mapping.sql"
