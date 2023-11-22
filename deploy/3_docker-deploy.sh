#!/bin/bash

# deploys current code on server in docker containers

# Set deploy host
deploy_host=""
if [ "$1" = "prd" ]; then
  echo "Production deploy"
  deploy_host=$RESUME_HOST
else
  echo "Dev deploy"
  deploy_host=$RESUME_HOST_DEV
fi

# Options
containers="api db cache nginx monitor"

# Vars
ssh_cmd="ssh $RESUME_USER@$deploy_host"
compose_cmd="sudo docker-compose -f /home/$RESUME_USER/resume/compose/production.yml"

# Deploy
$ssh_cmd $compose_cmd stop $containers
$ssh_cmd $compose_cmd rm -f $containers
$ssh_cmd $compose_cmd up -d $containers

# Clear cache
$ssh_cmd "sudo docker exec cache redis-cli FLUSHALL"
