FROM	alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc
RUN apk add nginx supervisor \
    php7 php7-fpm php7-mysqli \ 
    php7-zlib php7-curl php7-mbstring \
    php7-json php7-session

RUN mkdir -p /www/
RUN mkdir /run/nginx

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
    tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
    rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin

COPY srcs/config.inc.php /www/phpmyadmin/
COPY srcs/start.sh start.sh
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir www/phpmyadmin/tmp
RUN chmod 777 www/phpmyadmin/tmp
RUN chmod 777 /run/nginx
RUN chmod 777 start.sh

EXPOSE 5000
CMD sh start.sh