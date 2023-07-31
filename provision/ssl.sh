#!/bin/bash

# Generate Certificate Request + Key
ssh $RESUME_USER@$RESUME_HOST "sudo mkdir /ssl"
ssh $RESUME_USER@$RESUME_HOST "openssl req -new -newkey rsa:2048 -nodes -keyout $RESUME_DNS.key -out $RESUME_DNS.csr"

# Install Certbot
# certbot certs are not recommended
# but they're good enough for my resume API
ssh $RESUME_USER@$RESUME_HOST sudo snap install --classic certbot
ssh $RESUME_USER@$RESUME_HOST sudo ln -s /snap/bin/certbot /usr/bin/certbot

# Install Nginx
sudo apt update
sudo apt install nginx

# Get Cert
ssh $RESUME_USER@$RESUME_HOST sudo certbot --nginx
ssh $RESUME_USER@$RESUME_HOST sudo certbot certonly --nginx

# Uninstall Nginx
# certbot requires a host level nginx install
# but I just want a cert to use in the container
sudo systemctl stop nginx-agent
sudo apt remove nginx
