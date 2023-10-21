gcloud beta compute machine-images create brian86 \
  --project=$RESUME_PROJECT_ID \
  --source-instance=$RESUME_INSTANCE_NAME \
  --source-instance-zone=$RESUME_INSTANCE_ZONE \
  --storage-location=$RESUME_STORAGE_LOCATION
