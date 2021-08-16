#!/bin/bash

# default port
export PORT=${PORT:-80}

# source variables
. ./.env

# shutdown
docker-compose kill
docker rm $(docker ps -a -f status=exited -q)

# build api
pushd ../API
mvn clean package -Dmaven.test.skip=true || exit 1
docker build -t dev/finportman-api .
popd

# build app
pushd ../portfolio_manager_frontend
npm run build
docker build -t dev/finportman-app .
popd

# start
docker-compose -f docker-compose.yml up -d

# clean up
docker rmi -f $(docker images -f "dangling=true" -q)

# open in browser
sleep 7
# chromium http://localhost:${PORT}/register
docker exec -it compose_api_1 sh -c 'tail -f /spring.log'
