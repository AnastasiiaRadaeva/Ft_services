FROM	alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc && \
    apk add php7 && \
    apk add php7-mbstring && \
    apk add php7-session && \
    apk add php7-json && \
    apk add php7-mysqli

RUN mkdir -p /usr/share/webapps/

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
    tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
    rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.2-all-languages /usr/share/webapps/phpmyadmin

COPY srcs/config.inc.php /usr/share/webapps/phpmyadmin/
COPY srcs/start.sh start.sh

EXPOSE 5000
CMD sh start.sh