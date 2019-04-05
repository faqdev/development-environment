#!/bin/sh

/vagrant/vagrant/ubuntu16/scripts/composer-install.sh

echo "==== Install laravel"
cd /home/vagrant && composer global require laravel/installer
sudo ln -sf /home/vagrant/.composer/vendor/bin/laravel /usr/local/bin/
