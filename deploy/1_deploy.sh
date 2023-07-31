#!/bin/bash

# deploy-sync.sh
# runs all deploy scripts

dir="$(dirname "$0")"
bash "$dir/2_code-sync.sh"
bash "$dir/3_docker-deploy.sh"
