#!/bin/bash
sudo apt-get update
sudo apt-get install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

sudo apt-get install -y unzip

sudo wget https://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip
sudo unzip typesafe-activator-1.3.6.zip -d /mnt/typesafe-activator

#add activator location to path
export PATH=/mnt/typesafe-activator/activator-dist-1.3.6:$PATH
cd /mnt/typesafe-activator/activator-dist-1.3.6
sudo chmod 777 activator

#activator new my-first-app play-java
#cd my-first-app
#activator run
