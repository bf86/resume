#/bin/bash

#
# Check disk space
#

# Setup
source $HOME/.bash_profile

# Vars / Options
dir="$(dirname "$0")"
hostname="$(cat /etc/hostname)"
outfile="$dir/space.log"

# Main
df -h /dev/root 2>&1 | tee $outfile
sed -i "1iSubject: Space check results ($hostname)" $outfile
cat $outfile | /usr/sbin/ssmtp $MONITOR_RECIPIENT
