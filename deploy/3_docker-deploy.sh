#!/bin/bash

# docker-deploy.sh
# deploys current code on server in docker containers

ssh $RESUME_USER@$RESUME_HOST "sudo docker-compose -f /home/$RESUME_USER/resume/compose/production.yml stop"
ssh $RESUME_USER@$RESUME_HOST "sudo docker-compose -f /home/$RESUME_USER/resume/compose/production.yml rm -f"
ssh $RESUME_USER@$RESUME_HOST "sudo docker-compose -f /home/$RESUME_USER/resume/compose/production.yml up -d"
