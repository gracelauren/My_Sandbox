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

echo "Checking Python Version"
python --version

echo "Installing easy install Python setup tools"
sudo apt-get install python-setuptools

echo "Installing Pip"
sudo apt-get install python-pip -y > /dev/null

echo "Installing Django"
sudo pip install django

echo "Installing virtualenv"
sudo pip install virtualenv

echo "Installing virtualenvwrapper"
sudo pip install virtualenvwrapper

echo "Creating the virtual environment for Python and Django"
virtualenv env

echo "Installing packages with respected versions"
sudo pip install -r requirements.txt

echo "Finished provisioning."
