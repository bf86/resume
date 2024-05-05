#!/bin/bash

#
# Deploys current code on server in docker containers
#

## Deploy host / user
deploy_host=""
deploy_user=""
compose_file=""
if [ "$1" = "prd" ]; then
  deploy_host=$RESUME_HOST
  deploy_user=$RESUME_USER
  compose_file="production.yml"
elif [ "$1" = "aws" ]; then
    deploy_host=$RESUME_IP_AWS_1
    deploy_user=$RESUME_USER_AWS
    compose_file="development.yml"
else
  deploy_host=$RESUME_HOST_STG
  deploy_user=$RESUME_USER
  compose_file="production.yml"
fi
echo "Deploying to $deploy_host as $deploy_user"

# Options
containers="api db cache nginx monitor"

# Vars
ssh_cmd="ssh $deploy_user@$deploy_host"
compose_cmd="sudo docker-compose -f /home/$deploy_user/resume/compose/$compose_file"

# Deploy
$ssh_cmd $compose_cmd stop $containers
$ssh_cmd $compose_cmd rm -f $containers
$ssh_cmd $compose_cmd up -d $containers

# Clear cache
$ssh_cmd "sudo docker exec cache redis-cli FLUSHALL"
