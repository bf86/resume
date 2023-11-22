#!/bin/bash

# runs all deploy scripts

dir="$(dirname "$0")"
bash $dir/2_code-copy.sh $1
bash $dir/3_docker-deploy.sh $1
