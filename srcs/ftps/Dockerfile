FROM alpine

RUN apk update
RUN apk add vsftpd
RUN apk add openssl

RUN adduser -D -g 'admin' admin
RUN echo 'admin:admin' | chpasswd

RUN openssl req -new -newkey rsa:2048 -nodes -keyout private.key -out csr.csr -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42Seoul/CN=localhost.com"
RUN openssl x509 -req -days 365 -in csr.csr -signkey private.key -out crt.crt

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD vsftpd /etc/vsftpd/vsftpd.conf