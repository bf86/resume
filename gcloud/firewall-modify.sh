gcloud compute --project=$RESUME_PROJECT_ID \
  firewall-rules update no-hackers \
    --source-ranges=#0.0.0.0/32,255.255.255.255/32
