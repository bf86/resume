# $1 - IP name e.g. mycoolapp-stg
# $2 - Should match VM region e.g. us-west2

gcloud compute addresses create $1 --region=$2

# Once reserved:
# - Search IP addresses in cloud console
# - Scroll to right, click 3 dots
# - Click reassign to another resource
