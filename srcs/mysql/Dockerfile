FROM alpine

ENV MYSQL_ROOT_PASSWORD=abcd
ENV MYSQL_DATABASE=wordpress
ENV HOST_ADDRESS=3306

RUN apk update
RUN apk add mysql mysql-client

COPY srcs/start.sh /start.sh
COPY srcs/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD sh /start.sh