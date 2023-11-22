#!/bin/bash

# Mirrors all production tables to local

# Vars
declare -a tables=(
  "app"
  "education"
  "faq"
  "ip"
  "project"
  "recommendation"
  "skill"
  "skill_type"
  "title"
)
dir="$(dirname "$0")"
psql_string="psql -h localhost -d $POSTGRES_DB_NAME -U $POSTGRES_USER"

bash $dir/foreign-server-setup.sh

# Mirror
for table in "${tables[@]}"
do
  echo
  echo "Mirroring $table:"
  table_dir="$dir/../table/$table"
  mirror_sql="BEGIN; TRUNCATE $table; INSERT INTO $table SELECT * FROM ${table}_production; COMMIT;"
  $psql_string < "$table_dir/4_create_foreign_table.sql"
  $psql_string -c "$mirror_sql"
done
