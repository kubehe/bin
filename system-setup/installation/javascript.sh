#!/usr/bin/env bash

apt install -y nodejs npm
apt update && sudo apt install -y yarn

chown -R $(whoami):$(id -gn $USER) ~/.npm
npm i npm@latest -g
npm i -g n ntl
n stable

yarn global add \
    create-react-app create-react-native-app \
    express-generator \
    jest eslint prettier \
    generator-jhipster yo \
    nodemon \
    localtunnel \
    now \
    # nodemon => detects changes and reruns automatically
    # localtunnel => fast for localhost
    # now => deploying easily docker/static

# user: mongodb pass: mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org
