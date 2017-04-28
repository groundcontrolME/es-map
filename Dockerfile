FROM nginx

# Launch the ES-map application running on an nginx container
# Container parameters as environment variables:
ENV HTML_DIR = /usr/share/nginx/html
ENV CONF_DIR = /etc/nginx

# optionally save logs to an external volume
#VOLUME /var/log/nginx/log
COPY start.sh .
COPY ./src/* ${HTML_DIR}/
COPY ./nginx/conf ${CONF_DIR}/

# variable substitution is done in the start.sh script 

ENTRYPOINT start.sh
