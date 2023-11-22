gcloud dns \
  --project=$RESUME_GCLOUD_PROJECT_ID \
  record-sets create $RESUME_DNS. \
  --zone="$RESUME_DNS_ZONE" \
  --type="A" \
  --ttl="86400" \
  --rrdatas="$RESUME_IP"
