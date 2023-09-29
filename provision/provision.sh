#!/bin/bash

# Install Docker
ssh $RESUME_USER@$RESUME_HOST "sudo snap install docker"

# Install ncdu
ssh $RESUME_USER@$RESUME_HOST "sudo apt-get install ncdu"

# I thought there would be more steps lol
# Good problem to have XD
