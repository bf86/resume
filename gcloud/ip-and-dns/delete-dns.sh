# $1 - DNS (eg. mycoolap-dev.com)
# $2 - DNS Zone (eg. mycoolap-dev-com)

gcloud dns record-sets delete $1 --type=A --zone=$2
