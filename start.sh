#!/bin/bash
# TODO: insert automatically WWW_ROOT from dockerfile
# ^ this is inserted automatically from Dockerfile
# Launch nginx after having substutited the parameters in index.html
# environment

export _ROOT=/usr/share/nginx/html
export CONF_DIR=/etc/nginx
export ELASTIC_LOC=${ELASTIC:-coordinator.elastic.l4lb.thisdcos.directory:9200}
export INDEX_NAME=${INDEX:-festival}
export INDEX_TYPE=${TYPE:-festival}

# command to run nginx
export COMMAND="nginx -g 'daemon off;'"

#chmod 777 ${WWW_ROOT}/index.html
#echo "**DEBUG: index.html should be at: "$(ls -la ${WWW_ROOT}/index.html)

# substitute environment variables into files controlling the configuration
sed -i -n "s,__ELASTIC_LOCATION__,${ELASTIC_LOC},g" ${_ROOT}/index.html 
sed -i -n "s,__INDEX_NAME__,${INDEX_NAME},g" ${_ROOT}/index.html 
sed -i -n "s,__INDEX_TYPE__,${INDEX_TYPE},g" ${_ROOT}/index.html 

# launch not needed as ngingx container already defines an entrypoint
#$COMMAND
