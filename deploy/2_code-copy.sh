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
  deploy_host=$RESUME_HOST_STG
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
  ### Build React UI before deploying
  if [ "$deploy_dir" = "../react-ui/build" ]; then
    echo "Building React UI:"
    cd $dir/../react-ui && REACT_APP_API_URI="$deploy_host" npm run build && cd $dir
  fi

  ### Ensure correct owner on config files (Docker changes owner to systedm-coredump)
  if [ "$deploy_dir" = "../config" ]; then
    echo "Setting config file owner:"
    ssh "$RESUME_USER@$deploy_host" "sudo chown -v $RESUME_USER $app_path/config/*"
  fi

  ### Copy
  echo "Copying $deploy_dir:"
  scp -r "$dir/$deploy_dir" "$RESUME_USER@$deploy_host:$app_path"

  ### Sync bash profile
  ### Place logrotate config
  if [ "$deploy_dir" = "../config" ]; then
    echo "Syncing bash profile:"
    ssh $RESUME_USER@$deploy_host "sudo cp -v $app_path/config/.bash_profile /home/$RESUME_USER"
    ssh $RESUME_USER@$deploy_host "source /home/$RESUME_USER/.bash_profile"
    echo "Placing logrotate config:"
    ssh $RESUME_USER@$deploy_host "sudo cp -v $app_path/config/logrotate.d/* /etc/logrotate.d/"
  fi

  ### Sync crontab
  if [ "$deploy_dir" = "../cron" ]; then
    echo "Syncing crontab:"
    ssh $RESUME_USER@$deploy_host "crontab $app_path/cron/_crontab"
  fi
done

# Finished
echo "Finished copying"
