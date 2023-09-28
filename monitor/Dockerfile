FROM node:latest

# Install gcloud
# curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-387.0.0-linux-x86_64.tar.gz
# tar -xf google-cloud-cli-387.0.0-linux-x86_64.tar.gz

# Copy project files
COPY ./bin /monitor
COPY ./package.json /monitor/package.json

# Npm install
WORKDIR /usr/src/app
RUN npm install
