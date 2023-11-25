#!/bin/bash

# Vars
declare -a tables=(
  "app"
  "education"
  "faq"
  "project"
  "recommendation"
  "skill_type"
  "skill"
  "title"
)
dir="$(dirname "$0")"
psql_string="psql -h localhost -d $POSTGRES_DB_NAME -U $POSTGRES_USER"

# Seed tables
for table in "${tables[@]}"
do
  create_path="$dir/../table/$table/2_seed.sql"
  if [ -f $copy_path ]; then
    echo "Seeding table $table:"
    $psql_string < $create_path
  fi
done

# Load FAQ answers
cd $dir && python3 3_load-faq-answers.py
