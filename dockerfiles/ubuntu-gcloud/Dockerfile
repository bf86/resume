#WIP

FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates gnupg curl

# RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] \
#    https://packages.cloud.google.com/apt cloud-sdk main" \
#    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] \
#   http://packages.cloud.google.com/apt cloud-sdk main" \
#   \ | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
#   \ && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
#   \ | tee /usr/share/keyrings/cloud.google.asc \
#   \ && apt-get update -y && apt-get install google-cloud-sdk -y

# Docker recommended version
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] \
    http://packages.cloud.google.com/apt cloud-sdk main" \
    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | apt-key --keyring /usr/share/keyrings/cloud.google.gpg \
    add - && apt-get update -y && apt-get install google-cloud-cli -y \


# RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
#   | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-get update && apt-get install google-cloud-cli
RUN gcloud init
