#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Configuring Nginx"
cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
# Restart Nginx for the config to take effect
service nginx restart > /dev/null

echo "Finished provisioning."
