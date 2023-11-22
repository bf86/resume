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
mysql_string="mysql"

# Create DB
$mysql_string -e "DROP DATABASE $MYSQL_DB_NAME"
$mysql_string -e "CREATE DATABASE $MYSQL_DB_NAME"

#
mysql_string="mysql $MYSQL_DB_NAME"

# Drop tables
for table in "${tables[@]}"
do
  echo "Dropping table $table"
  $mysql_string -e "DROP TABLE IF EXISTS $table CASCADE"
done

# Create tables
for table in "${tables[@]}"
do
  create_path="$dir/../table/$table/1_create.sql"
  if [ -f $create_path ]; then
    echo "Creating table $table"
    $mysql_string < $create_path
  fi
done
