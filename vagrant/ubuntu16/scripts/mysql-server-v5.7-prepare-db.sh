#!/bin/sh

scriptPath=`dirname $0`
echo "${scriptPath}"
cd "${scriptPath}/../../.."
pwd

set -e -x

sudo mysql < ./db/mysql/v5.7/001_create-database.sql
sudo mysql < ./db/mysql/v5.7/002_drop-user.sql | true
sudo mysql < ./db/mysql/v5.7/003_create-user.sql

echo "Please, set bind-address equal to 0.0.0.0 in my.cnf and restart mysql service"
