FROM nginx

# optionally save logs to an external volume
#VOLUME /var/log/nginx/log
COPY start.sh .
COPY ./src /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/

# variable substitution is done in the start.sh script 
#RUN ./start.sh

#nginx container already defines an entry point
ENTRYPOINT nginx -g 'daemon off;'
