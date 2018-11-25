#!/usr/bin/env bash

snap install docker circleci
snap connect circleci:docker docker

groupadd docker
usermod -aG docker $USER
newgrp docker

apt install -y docker-compose