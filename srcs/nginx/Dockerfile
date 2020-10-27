FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx \
            openssl \
            openssh \
            supervisor

COPY ./start.sh start.sh
COPY ./your_domain /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

RUN chmod -R 777 start.sh
RUN mkdir -p /run/nginx

EXPOSE 80 443
CMD sh start.sh