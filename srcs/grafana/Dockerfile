FROM alpine

RUN apk update
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENV GF_SECURITY_ADMIN_USER=root
ENV GF_SECURITY_ADMIN_PASSWORD=abcd

COPY srcs/grafana.ini /grafana.ini
COPY srcs/dashboards /etc/grafana/dashboards

WORKDIR /usr/share/grafana/conf/provisioning/
COPY srcs/datasource.yaml datasources/datasource.yaml
COPY srcs/dashboard.yaml dashboards/dashboard.yaml
WORKDIR /

CMD grafana-server --config=/grafana.ini --homepath=/usr/share/grafana