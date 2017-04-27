FROM nginx

ENV HTML_DIR /usr/share/nginx/html
ENV CONF_DIR /etc/nginx
ENV ELASTIC_LOC coordinator.elastic.l4lb.thisdcos.directory:9200
ENV INDEX_NAME gathering

#VOLUME /var/log/nginx/log

COPY ./src ${HTML_DIR}
COPY ./nginx/conf ${CONF_DIR}

#substitute the parameter to connect to ES
#
#			host = 'localhost:9200', //Elasticsearch address if tunnel is used
#			index = 'taxi', //DataSource Index
#			type = 'taxi', //DataSource Type

RUN sed -i '' "s/host = 'localhost:9200'/host = '${ELASTIC_LOC}'/g" ${HTML_DIR}/index.html
RUN sed -i '' "s/index = 'taxi'/index = '${INDEX_NAME}'/g" ${HTML_DIR}/index.html
RUN sed -i '' "s/type = 'taxi'/type = '${INDEX_TYPE}/g" ${HTML_DIR}/index.html 

#ENTRYPOINT default
