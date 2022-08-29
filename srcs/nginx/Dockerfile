FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl

RUN adduser -D -g 'www' www
RUN adduser -D -g 'user' user
RUN echo 'user:abcd' | chpasswd

RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

COPY ./srcs/motd /etc/motd
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/index.html /www/index.html

EXPOSE 80 443 22

COPY ./srcs/start.sh /start.sh
ENTRYPOINT sh /start.sh