#!/bin/sh

sudo cp /vagrant/vagrant/ubuntu16/fs/etc/mongod.conf_3.6 /etc/mongod.conf
sudo service mongod stop
sudo service mongod start
