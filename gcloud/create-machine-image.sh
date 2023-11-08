gcloud beta compute machine-images create $RESUME_MACHINE_IMAGE \
  --project=$RESUME_PROJECT_ID \
  --source-instance=$RESUME_INSTANCE_NAME \
  --source-instance-zone=$RESUME_INSTANCE_ZONE \
  --storage-location=$RESUME_STORAGE_LOCATION
