# INCOMPLETE - use ${RESUME_PATH}/provision/get-cert.sh instead
# $1 = DNS (eg. mycoolap-dev.com)
# $2 = DNS Zone (eg. mycoolap-dev-com)

# Create
gcloud certificate-manager certificates create $2 --domains="$1"

# Verify
gcloud certificate-manager certificates describe $2

# Create Map
gcloud certificate-manager maps create $2

# Create Map Entry
gcloud certificate-manager maps entries create $2 \
  --map="$2" \
  --certificates="$2" \
  --hostname="$1"

# Verify Map Entry
gcloud certificate-manager maps entries describe $2 \
    --map="$2"
