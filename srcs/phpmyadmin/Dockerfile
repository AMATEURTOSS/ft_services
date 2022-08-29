FROM alpine

RUN apk update
RUN apk add nginx php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
    php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
    php7-session php7-ldap php7-ctype php7-dom php7-mbstring php7-fpm openssl

ENV PHP_FPM_USER "www"
ENV PHP_FPM_GROUP "www"
ENV PHP_FPM_LISTEN_MODE "0660"
ENV PHP_MEMORY_LIMIT "512M"
ENV PHP_MAX_UPLOAD "50M"
ENV PHP_MAX_FILE_UPLOAD "200"
ENV PHP_MAX_POST "100M"
ENV PHP_DISPLAY_ERRORS "On"
ENV PHP_DISPLAY_STARTUP_ERRORS "On"
ENV PHP_ERROR_REPORTING "E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR"
ENV PHP_CGI_FIX_PATHINFO 0

WORKDIR /var/www/html

RUN wget -O phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.9.6/phpMyAdmin-4.9.6-all-languages.tar.gz
RUN tar -xvf phpmyadmin.tar.gz
RUN rm phpmyadmin.tar.gz
RUN mv phpMyAdmin-4.9.6-all-languages phpmyadmin
RUN chmod -R 777 phpmyadmin
COPY srcs/config.inc.php phpmyadmin/config.inc.php

WORKDIR /

RUN adduser -D -g 'www' www
RUN chown -R www:www /var/www/html/phpmyadmin
RUN chown -R www:www /var/lib/nginx
COPY srcs/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx

EXPOSE 5000

COPY srcs/start.sh /start.sh
CMD sh /start.sh