#!/bin/bash
MAVEN_VERSION=3.9.9

set -e

echo "PS1='\h \W \$ '" >> ~/.bashrc

#echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
export DEBIAN_FRONTEND=noninteractive

apt-get -qq update -y
apt-get install -y -qq openjdk-17-jdk openjdk-17-jre jq

# Installing Maven
wget https://www.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp
wget https://www.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512 -P /tmp
echo " apache-maven-${MAVEN_VERSION}-bin.tar.gz" >>/tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512
( cd /tmp &&  sha512sum -c apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512)
tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt
ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven
ln -s /opt/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn

echo DONE >/tmp/DONE
