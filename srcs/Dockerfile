FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl

COPY ./nginx/start.sh ./tmp
COPY ./nginx/your_domain ./tmp

#RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 777 /tmp/start.sh
RUN mkdir -p /run/nginx

EXPOSE 80 443
CMD sh ./tmp/start.sh