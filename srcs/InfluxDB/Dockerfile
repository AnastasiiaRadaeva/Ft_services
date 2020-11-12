FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add openrc && \
	apk add influxdb

EXPOSE 8086
CMD influxd