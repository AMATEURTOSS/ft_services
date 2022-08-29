# generate ssl key
ssh-keygen -A
openssl req -new -newkey rsa:2048 -nodes -keyout private.key -out csr.csr -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42Seoul/CN=localhost.com"
openssl x509 -req -days 365 -in csr.csr -signkey private.key -out crt.crt
# ssh start
/usr/sbin/sshd
# nginx start
nginx -g 'daemon off;'