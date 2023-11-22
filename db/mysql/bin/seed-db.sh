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
mysql_string="mysql --local-infile=1 $MYSQL_DB_NAME"

# Allow copy
$mysql_string -e 'SET GLOBAL local_infile=1'

# Seed
for table in "${tables[@]}"
do
  copy_path="$dir/../table/$table/2_copy.sql"
  if [ -f $copy_path ]; then
    echo "Seeding table $table"
    $mysql_string < $copy_path
  fi
done
