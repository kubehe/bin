#!/usr/bin/env bash

apt install -y nodejs npm
apt update && sudo apt install -y yarn

yarn global add create-react-app create-react-native-app express-generator jest eslint prettier

# detects changes and reruns automatically
yarn global add nodemon

# fast for localhost
yarn global add localtunnel

# deploying easily docker/static
yarn global add now

# user: mongodb pass: mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org
