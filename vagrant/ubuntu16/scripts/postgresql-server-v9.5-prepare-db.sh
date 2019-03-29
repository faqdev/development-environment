#!/bin/sh

scriptPath=`dirname $0`
echo "${scriptPath}"
cd "${scriptPath}/../../.."
pwd

set -e -x

sudo -u postgres psql < ./db/postgresql/v9.5/001_create-database.sql
sudo -u postgres psql < ./db/postgresql/v9.5/002_drop-user.sql | true
sudo -u postgres psql < ./db/postgresql/v9.5/003_create-user.sql

echo "Please, set listen_addresses equal to '*' in postgresql.conf and restart postgresql service"
