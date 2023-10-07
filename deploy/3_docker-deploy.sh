#!/bin/bash

# deploys current code on server in docker containers

# Options
containers="api db nginx monitor"

# Vars
ssh_cmd="ssh $RESUME_USER@$RESUME_HOST"
compose_cmd="sudo docker-compose -f /home/$RESUME_USER/resume/compose/production.yml"

# Deploy
$ssh_cmd $compose_cmd stop $containers
$ssh_cmd $compose_cmd rm -f $containers
$ssh_cmd $compose_cmd up -d $containers
