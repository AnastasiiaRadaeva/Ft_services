FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc 

RUN apk add openrc && \
    apk add php7 && \
	apk add php7-fpm && \
	apk add php7-zlib && \
	apk add php7-curl && \
    apk add php7-mbstring && \
    apk add php7-session && \
    apk add php7-json && \
    apk add php7-mysqli && \
	apk add openssh openssl

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /www/

COPY srcs/wp-config.php /www/
COPY srcs/start.sh start.sh

RUN	chmod 777 start.sh

EXPOSE 5050
CMD	sh start.sh