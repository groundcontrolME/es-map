FROM nginx

# optionally save logs to an external volume
#VOLUME /var/log/nginx/log
COPY ./src /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/

#nginx container already defines an entry point
ENTRYPOINT nginx -g 'daemon off;'
