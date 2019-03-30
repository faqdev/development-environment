#!/bin/sh

set -x

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
sudo cp /vagrant/vagrant/ubuntu16/fs/etc/apt/sources.list.d/mongodb-org-3.4.list /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
sudo systemctl enable mongod
