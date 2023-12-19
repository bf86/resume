# #!/bin/bash

#
# Copy this to host and run there
#

set -e

# $1 - DNS (eg. mycoolap-dev.com)
# $2 - App name for cert location (eg. mycoolap)

# Generate Certificate Request + Key
ssl_dir="/ssl"
[ -d $ssl_dir ] || sudo mkdir $ssl_dir
openssl req -new -newkey rsa:2048 -nodes -keyout $1.key -out $1.csr

# Install Certbot
# Certbot certs are not recommended
# But they're good enough for my resume site
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# Install Nginx
sudo apt update
sudo apt install -y nginx

# Get Cert
# Will require answering some prompts
# Okay to leave Organization and extra fields blank
sudo certbot certonly --nginx || true

# Place cert in app dir
sudo cp -v /etc/letsencrypt/live/$1/fullchain.pem $HOME/$2/ssl/
sudo cp -v /etc/letsencrypt/live/$1/privkey.pem $HOME/$2/ssl/

# Uninstall Nginx
# Certbot requires a host level nginx install
# But I just want a cert to use in the container
sudo systemctl stop nginx-agent
sudo apt remove -y nginx nginx-common nginx-core
sudo rm -rf /usr/sbin/nginx

# Uninstall Certbot
sudo snap remove certbot
sudo rm -rf /usr/bin/certbot
