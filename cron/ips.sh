#/bin/bash

#
# Log all IPs from nginx logs to db and flag malicious
#

# Setup
source $HOME/.bash_profile

# Vars / Options
dir="$(dirname "$0")"
hostname="$(cat /etc/hostname)"
outfile="$dir/ip.log"

# Main
sudo docker exec -t monitor ruby "/monitor/bin/rb/record_ips.rb" 2>&1 | tee $outfile
sed -i "1iSubject: Record IP results ($hostname)" $outfile
cat $outfile | /usr/sbin/ssmtp $MONITOR_RECIPIENT
