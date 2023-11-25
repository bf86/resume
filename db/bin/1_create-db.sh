#!/bin/bash

# Vars
declare -a tables=(
  "app"
  "education"
  "faq"
  "ip"
  "project"
  "recommendation"
  "skill_type"
  "skill"
  "title"
)
dir="$(dirname "$0")"
psql_string="psql -h localhost -d $POSTGRES_DB_NAME -U $POSTGRES_USER"

# Drop tables
for table in "${tables[@]}"
do
  echo "Dropping table $table:"
  $psql_string -c "DROP TABLE IF EXISTS $table CASCADE"
done

# Create tables
for table in "${tables[@]}"
do
  create_path="$dir/../table/$table/1_create.sql"
  if [ -f $create_path ]; then
    echo "Creating table $table:"
    $psql_string < $create_path
  else
    echo "Create file does not exist: $create_path"
  fi
done
