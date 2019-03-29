#!/bin/sh

sudo cp /vagrant/vagrant/ubuntu16/fs/etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql stop
sudo service mysql start
