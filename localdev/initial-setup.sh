#!/bin/bash

docker-compose -f $RESUME_PATH/compose/localdev.yml stop
docker-compose -f $RESUME_PATH/compose/localdev.yml rm -f
docker-compose -f $RESUME_PATH/compose/localdev.yml up -d db

docker exec db psql -h localhost -U $RESUME_DB_USER -c "CREATE DATABASE $RESUME_DB_NAME"
docker exec db bash /usr/src/app/bin/1_create-db.sh
docker exec db bash /usr/src/app/bin/2_seed-db.sh

docker-compose -f $RESUME_PATH/compose/localdev.yml up -d
