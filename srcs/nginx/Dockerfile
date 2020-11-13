FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add nginx && \
    apk add openssl && \
    apk add openssh && \
	apk add supervisor && \
    apk add openrc

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=kbatwoma"

RUN mkdir www

COPY srcs/start.sh start.sh
COPY srcs/your_domain /etc/nginx/conf.d/default.conf
COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/index.html /www/index.html

RUN mkdir -p /run/nginx         
RUN mkdir /run/sshd             
RUN chmod -R 777 start.sh       
RUN chmod -R 777 /run/nginx   
RUN chmod -R 777 /run/sshd
RUN chmod -R 777 /www    

EXPOSE 80 443 22
CMD sh start.sh