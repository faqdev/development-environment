#!/bin/sh

MYSQL_ROOT_PASSWORD=`cat /vagrant/vagrant/ubuntu16/mysql-server-password.txt | grep . | tr -d '\r\n'`

scriptPath=`dirname $0`
echo "${scriptPath}"
cd "${scriptPath}/../../.."
pwd

sudo mysql --password=${MYSQL_ROOT_PASSWORD} < ./db/mysql/v5.7/001_create-database.sql
sudo mysql --password=${MYSQL_ROOT_PASSWORD} < ./db/mysql/v5.7/002_drop-user.sql | true
sudo mysql --password=${MYSQL_ROOT_PASSWORD} < ./db/mysql/v5.7/003_create-user.sql

echo "Please, set bind-address equal to 0.0.0.0 in my.cnf and restart mysql service"
