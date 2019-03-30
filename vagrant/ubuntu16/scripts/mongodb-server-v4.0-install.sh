#!/bin/sh

set -x

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
sudo cp /vagrant/vagrant/ubuntu16/fs/etc/apt/sources.list.d/mongodb-org-4.0.list /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
sudo systemctl enable mongod
