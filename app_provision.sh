#!/bin/bash

# Update and upgrade packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install nginx web server
sudo apt-get install nginx -y

# Replace default config file


# Reverse proxy

sudo sed -i 's+try_files $uri $uri/ =404;+proxy_pass http://localhost:3000/;+' /etc/nginx/sites-available/default

# Restart nginx web server
sudo systemctl restart nginx

# Keep it running on reboot
sudo systemctl enable nginx

# Install app dependencies
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g

# Add database host IP info to .bashrc
echo -e "\export DB_HOST=mongodb://172.31.59.25:27017/posts" | sudo tee -a .bashrc
source .bashrc

# Get repo with app folder

git clone https://github.com/Asanjena/app.git

# Install the app
cd app
sudo npm install

# Seed the database
node seeds/seed.js

# Start the app
pm2 start app.js --update-env

# If already started, restart (idempotency)
pm2 restart app.js --update-env

