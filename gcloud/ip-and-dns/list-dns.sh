# $1 - DNS Zone (eg. mycoolap-dev-com)

gcloud dns record-sets list --zone="$1"
