#!/usr/bin/env bash

# apt install -y openjdk-11-jdk # installs java 10.0.2?!?

add-apt-repository ppa:openjdk-r/ppa \
&& apt-get update -q \
&& apt install -y openjdk-11-jdk

apt install --only-upgrade default-jdk
update-alternatives --config java

apt install -y maven gradle

wget http://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz

tar -xvzf wildfly-14.0.0.Final.tar.gz
mv wildfly-14.0.0.Final ~/wildfly

~/wildfly/bin/add-user.sh


# todo add undertow xorigin in standalone!

rm wildfly-14.0.0.Final.tar.gz
rm -rf wildfly-14.0.0.Final

snap install intellij-idea-ultimate --classic

snap install android-studio --classic