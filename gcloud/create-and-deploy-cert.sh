# Create
gcloud certificate-manager certificates create $RESUME_DNS_ZONE --domains="$RESUME_DNS"

# Verify
gcloud certificate-manager certificates describe $RESUME_DNS_ZONE

# Create Map
gcloud certificate-manager maps create $RESUME_DNS_ZONE

# Create Map Entry
gcloud certificate-manager maps entries create $RESUME_DNS_ZONE \
  --map="$RESUME_DNS_ZONE" \
  --certificates="$RESUME_DNS_ZONE" \
  --hostname="$RESUME_DNS"

# Verify Map Entry
gcloud certificate-manager maps entries describe $RESUME_DNS_ZONE \
    --map="$RESUME_DNS_ZONE"
