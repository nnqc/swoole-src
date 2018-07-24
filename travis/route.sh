#!/bin/sh
#------------Only run once-------------
if [ "`php -v | grep "7\.2\.\d"`" ]; then
    set -e
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose && \
    chmod +x docker-compose && \
    sudo mv docker-compose /usr/local/bin && \
    docker-compose -v && \
    docker -v && \
    mkdir data && \
    mkdir data/mysql && \
    mkdir data/redis && \
    chmod -R 777 data && \
    docker-compose -f ./travis/docker-compose.yml up -d && \
    docker exec swoole_src_php /bin/sh /swoole-src/travis/docker-all.sh
fi