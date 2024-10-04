# #!/bin/bash

#
# Copy this to host and run there
#

set -e

# $APP_NAME - DNS (eg. mycoolap-dev.com)
# $DNS_NAME - App name for cert location (eg. mycoolap)

if [[ -z "$APP_NAME" || -z "$DNS_NAME" ]]; then
    echo "please ensure APP_NAME and DNS_NAME env vars are set"
    exit 1
fi

ssl_dir="/ssl"

# This does not need to run every time
# Generate Certificate Request + Key
# [ -d $ssl_dir ] || sudo mkdir $ssl_dir
# sudo openssl req -new -newkey rsa:2048 -nodes -keyout $APP_NAME.key -out $APP_NAME.csr

# Install Certbot
# Certbot certs are not recommended
# But they're good enough for my resume site
sudo snap install --classic certbot || true
sudo ln -s /snap/bin/certbot /usr/bin/certbot || true

# Stop nginx container
sudo docker stop nginx || true

# Install Nginx
sudo apt update
sudo apt install -y nginx

# Get Cert
# Will require answering some prompts
# Okay to leave Organization and extra fields blank
sudo certbot certonly --nginx

# Place cert in app dir
# NOTE: Previous certs can be found in /etc/letsencrypt/archive
sudo cp -v /etc/letsencrypt/live/$DNS_NAME/fullchain.pem $HOME/$APP_NAME/ssl/
sudo cp -v /etc/letsencrypt/live/$DNS_NAME/privkey.pem $HOME/$APP_NAME/ssl/

# Uninstall Nginx
# Certbot requires a host level nginx install
# But I just want a cert to use in the container
sudo systemctl stop nginx-agent || true
sudo apt-get remove -y nginx nginx-common nginx-core
sudo apt-get purge -y nginx nginx-common nginx-core
sudo rm -rf /usr/sbin/nginx

# Uninstall Certbot
sudo snap remove certbot
sudo rm -rf /usr/bin/certbot

# Restart nginx container
sudo docker start nginx || true
