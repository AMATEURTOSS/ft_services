FROM alpine

RUN apk update
RUN apk add influxdb
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

ENV INFLUXDB_CONFIG_PATH=/etc/influxdb/influxdb.conf
ENV INFLUXDB_USERNAME=root
ENV INFLUXDB_PASSWORD=abcd
ENV INFLUXDB_DATABASE=grafana
ENV INFLUXDB_HOST=influxdb

RUN mkdir -p /run/influxd
RUN mkdir -p /var/lib/influxdb
COPY srcs/influxdb.conf /etc/influxdb/influxdb.conf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

COPY srcs/start.sh /start.sh
CMD sh /start.sh