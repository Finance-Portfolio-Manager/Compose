#!/bin/bash

# source variables
. ./.env

# shutdown
docker-compose down 2> /dev/null
docker stop finportman-app 2> /dev/null
docker stop finportman-api 2> /dev/null

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
chromium http://localhost:8081/register
