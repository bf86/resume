#!/bin/bash

# code-sync.sh
# copies code to relevant host

dir="$(dirname "$0")"
app_path="/home/$RESUME_USER/resume"

ssh $RESUME_USER@$RESUME_HOST "mkdir -p $app_path"
# scp -r "$dir/../compose" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../cron" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../config" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../db" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../fastify" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../html" "$RESUME_USER@$RESUME_HOST:$app_path"
scp -r "$dir/../monitor" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../provision" "$RESUME_USER@$RESUME_HOST:$app_path"
# scp -r "$dir/../ssl" "$RESUME_USER@$RESUME_HOST:$app_path"
