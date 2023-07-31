gcloud dns record-sets delete $RESUME_DNS \
    --type=A \
    --zone=$RESUME_DNS_ZONE
