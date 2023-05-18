sudo apt-get upgrade -y

# install nginx

sudo apt-get install nginx -y

# nginx reverse proxy

#!/bin/bash

sudo bash -c 'cat <<EOF > /etc/nginx/sites-available/default

server {

listen 80 default_server;

listen [::]:80 default_server;

root /var/www/html;

server_name 18.202.19.236



location / {

proxy_pass http://18.202.19.236:3000;

proxy_http_version 1.1;

proxy_set_header Upgrade \$http_upgrade;

proxy_set_header Connection 'upgrade';

proxy_set_header Host \$host;

proxy_cache_bypass \$http_upgrade;

 }

location /posts {

 proxy_pass http://18.202.19.236:3000;

proxy_http_version 1.1;

 proxy_set_header Upgrade \$http_upgrade;

proxy_set_header Connection 'upgrade';

proxy_set_header Host \$host;

 proxy_cache_bypass \$http_upgrade;
}

}

EOF'


