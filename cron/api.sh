#/bin/bash

#
# Confirm all API endpoint responses
#

# Setup
source $HOME/.bash_profile

# Vars / Options
dir="$(dirname "$0")"
hostname="$(cat /etc/hostname)"
outfile="$dir/api.log"

# Main
sudo docker exec -t monitor \
  rspec -f documentation --no-color "/monitor/api-test/endpoints.rb" 2>&1 | tee $outfile
sed -i "1iSubject: API monitor results ($hostname)" $outfile
cat $outfile | /usr/sbin/ssmtp $MONITOR_RECIPIENT
