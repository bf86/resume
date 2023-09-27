#!/bin/bash

# Vars
declare -a tables=(
  "app"
  "education"
  "project"
  "skill"
  "skill_type"
  "title"
)
dir="$(dirname "$0")"
psql_string="psql -h localhost -d $POSTGRES_DB -U $POSTGRES_USER"

# Create
for table in "${tables[@]}"
do
  create_path="$dir/../table/$table/2_copy.sql"
  if [ -f $copy_path ]; then
    echo "Seeding table $table:"
    $psql_string < $create_path
  fi
done
