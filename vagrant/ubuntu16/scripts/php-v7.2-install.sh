#!/bin/sh

echo "==== Install PHP"
sudo apt-get update && sudo apt-get -y dist-upgrade
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/nginx
sudo apt-get update && sudo apt-get -y --allow-unauthenticated dist-upgrade
sudo apt-get install -y --allow-unauthenticated php7.2
sudo apt-get update && sudo apt-get -y --allow-unauthenticated dist-upgrade

sudo apt-get install -y --allow-unauthenticated php7.2-zip
sudo apt-get install -y --allow-unauthenticated php7.2-mbstring
sudo apt-get install -y --allow-unauthenticated php7.2-dom

# For Symfony
sudo apt-get install -y --allow-unauthenticated php7.2-curl

# MySQL support:
# sudo apt-get install -y --allow-unauthenticated php7.2-mysql
