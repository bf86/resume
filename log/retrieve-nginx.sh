#!/bin/bash

app_path="/home/$RESUME_USER/resume"
scp $RESUME_USER@$RESUME_HOST:$app_path/log/access.log .
