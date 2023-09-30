#/bin/bash

source $HOME/.bash_profile

dir="$(dirname "$0")"
outfile="$dir/api.log"

sudo docker exec -t monitor \
  rspec -f documentation --no-color "/monitor/api-test/endpoints.rb" 2>&1 | tee $outfile
sed -i '1iSubject: API monitor results' $outfile
cat $outfile | /usr/sbin/ssmtp $MONITOR_RECIPIENT
