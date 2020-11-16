FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add vsftpd && \
    apk add openssl && \
    apk add openrc

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=kbatwoma"

RUN adduser -D -h /var/ftp kbatwoma; echo "kbatwoma:root" | chpasswd

RUN mkdir -p /var/ftp

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/start.sh start.sh

RUN chmod 777 start.sh

EXPOSE 20 21 30000
CMD sh start.sh