#!/bin/sh

sudo cp /vagrant/vagrant/ubuntu16/fs/etc/postgresql/9.5/main/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf
sudo cp /vagrant/vagrant/ubuntu16/fs/etc/postgresql/9.5/main/postgresql.conf /etc/postgresql/9.5/main/postgresql.conf
sudo service postgresql stop
sudo service postgresql start
