#/bin/bash

#
# Rotate nginx access log
#

# Setup
source $HOME/.bash_profile

# Vars / Options
dir="$(dirname "$0")"
hostname="$(cat /etc/hostname)"
outfile="$dir/logrotate.log"

# Main
sudo logrotate -v /etc/logrotate.d/docker-nginx  2>&1 | tee $outfile
sed -i "1iSubject: Log rotate results ($hostname)" $outfile
cat $outfile | /usr/sbin/ssmtp $MONITOR_RECIPIENT
