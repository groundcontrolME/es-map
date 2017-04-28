#/bin/bash
# Launch nginx after having substutited the parameters in index.html
# environment
HTML_DIR = /usr/share/nginx/html
CONF_DIR = /etc/nginx
ELASTIC_LOC = ${ELASTIC:-coordinator.elastic.l4lb.thisdcos.directory:9200}
INDEX_NAME = ${INDEX:-festival}
INDEX_TYPE = ${TYPE:-festival}

# command to run nginx
COMMAND = "nginx -g daemon off"

# substitute environment variables into files controlling the configuration
sed -i '' "s/host = 'localhost:9200'/host = '${ELASTIC_LOC}'/g" ${HTML_DIR}/index.html
sed -i '' "s/index = 'taxi'/index = '${INDEX_NAME}'/g" ${HTML_DIR}/index.html
sed -i '' "s/type = 'taxi'/type = '${INDEX_TYPE}/g" ${HTML_DIR}/index.html

# launch
sh -c ${COMMAND}
