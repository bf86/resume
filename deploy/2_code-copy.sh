#!/bin/bash

set -e

#
# Copies code to specified host
#

# Options
## Deploy dirs
declare -a deploy_dirs=(
  "../compose"
  "../cron"
  "../config"
  "../db"
  "../fastify"
  "../monitor"
  "../provision"
  "../react-ui/build"
  "../ssl"
)

## Deploy host
deploy_host=""
if [ "$1" = "prd" ]; then
  deploy_host=$RESUME_HOST
else
  deploy_host=$RESUME_HOST_DEV
fi
echo "Deploying to $deploy_host"

# Main
## Ensure app dir present
app_path="/home/$RESUME_USER/resume"
ssh $RESUME_USER@$deploy_host "mkdir -p $app_path"

## Copy deploy dirs
dir="$(dirname "$0")"
for deploy_dir in "${deploy_dirs[@]}"
do
  echo "Copying $deploy_dir:"
  scp -r "$dir/$deploy_dir" "$RESUME_USER@$deploy_host:$app_path"
done

## Sync bash profile
echo "Syncing bash profile"
ssh $RESUME_USER@$deploy_host "sudo cp $app_path/config/.bash_profile /home/$RESUME_USER"
ssh $RESUME_USER@$deploy_host "source /home/$RESUME_USER/.bash_profile"

# Finished
echo "Finished copying"
