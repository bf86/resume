# $1 - DNS (eg. mycoolap-dev.com)
# $2 - DNS Zone (eg. mycoolap-dev-com)
# $3 - IP

gcloud dns \
  --project=$RESUME_GCLOUD_PROJECT_ID \
  record-sets create $1. \
  --zone="$2" \
  --type="A" \
  --ttl="300" \
  --rrdatas="$3"
