#!/bin/sh

# config nginx
mv /tmp/your_domain /etc/nginx/conf.d/default.conf

# ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=kbatwoma"

# start
nginx -g 'daemon off;' #запускаем без демона, в фоновом режиме???