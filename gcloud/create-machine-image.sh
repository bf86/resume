# Suggested image name format:
# brian86-YYYY-MM-DD

gcloud beta compute machine-images create $1 \
  --project=$RESUME_GCLOUD_PROJECT_ID \
  --source-instance=$RESUME_INSTANCE_NAME \
  --source-instance-zone=$RESUME_INSTANCE_ZONE \
  --storage-location=$RESUME_STORAGE_LOCATION
