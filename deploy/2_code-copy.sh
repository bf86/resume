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
  "../laravel"
  "../monitor"
  "../provision"
  "../react-ui/build"
  "../ssl"
)

## Deploy host / user
deploy_host=""
deploy_user=""
if [ "$1" = "prd" ]; then
  deploy_host=$RESUME_HOST
  deploy_user=$RESUME_USER
elif [ "$1" = "aws" ]; then
    deploy_host=$RESUME_IP_AWS_1
    deploy_user=$RESUME_USER_AWS
else
  deploy_host=$RESUME_HOST_STG
  deploy_user=$RESUME_USER
fi
echo "Deploying to $deploy_host as $deploy_user"

# Main
## Ensure app dir present
app_path="/home/$deploy_user/resume"
ssh $deploy_user@$deploy_host "mkdir -p $app_path"

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
    ssh "$deploy_user@$deploy_host" "sudo chown -v $deploy_user $app_path/config/* || true"
  fi

  ### Copy
  echo "Copying $deploy_dir:"
  echo "rsync -azv -e \"ssh -l $deploy_user\" \"$dir/$deploy_dir\" \"$deploy_user@$deploy_host:$app_path\""
  rsync -azv -e "ssh -l $deploy_user" "$dir/$deploy_dir" "$deploy_user@$deploy_host:$app_path"

  ### Sync bash profile
  ### Place logrotate config
  if [ "$deploy_dir" = "../config" ]; then
    echo "Syncing bash profile:"
    ssh $deploy_user@$deploy_host "sudo cp -v $app_path/config/.bash_profile /home/$deploy_user"
    ssh $deploy_user@$deploy_host "source /home/$deploy_user/.bash_profile"
    echo "Placing logrotate config:"
    ssh $deploy_user@$deploy_host "sudo cp -v $app_path/config/logrotate.d/* /etc/logrotate.d/"
  fi

  ### Sync crontab
  if [ "$deploy_dir" = "../cron" ]; then
    echo "Syncing crontab"
    ssh $deploy_user@$deploy_host "crontab $app_path/cron/_crontab"
  fi
done

# Finished
echo "Finished copying"
