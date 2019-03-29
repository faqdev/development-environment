#!/bin/sh

MYSQL_ROOT_PASSWORD=`cat /vagrant/vagrant/ubuntu16/mysql-server-password.txt | grep . | tr -d '\r\n'`

sudo apt-get update
echo "mysql-server mysql-server/root_password password ${MYSQL_ROOT_PASSWORD}" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${MYSQL_ROOT_PASSWORD}" | sudo debconf-set-selections
sudo apt-get install -q -y mysql-server-5.7
