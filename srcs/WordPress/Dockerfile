FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc 

RUN	apk add nginx supervisor \
	php7 php7-fpm php7-mysqli \ 
	php7-zlib php7-curl php7-mbstring \
	php7-json php7-session

RUN mkdir www

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /www/

COPY srcs/wp-config.php /www/
COPY srcs/start.sh start.sh
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx
RUN chmod -R 777 /run/nginx
RUN	chmod 777 start.sh
RUN	chmod 777 /www

EXPOSE 5050
CMD	sh start.sh