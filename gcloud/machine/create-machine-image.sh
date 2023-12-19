# $1 = Image name (suggested format: mycoolapp-YYYY-MM-DD)
# $2 = Instance name e.g. my-cool-app-1

gcloud beta compute machine-images create $1 \
  --project=$RESUME_GCLOUD_PROJECT_ID \
  --source-instance=$2 \
  --source-instance-zone=$RESUME_INSTANCE_ZONE \
  --storage-location=$RESUME_STORAGE_LOCATION
