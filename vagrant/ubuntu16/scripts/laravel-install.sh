#!/bin/sh

echo "==== Install composer"
# see https://getcomposer.org/download/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

echo "==== Install laravel"
sudo mkdir -p /home/vagrant/.composer
sudo chmod -R 0777 /home/vagrant/.composer
cd /home/vagrant && composer global require laravel/installer
sudo ln -sf /home/vagrant/.composer/vendor/bin/laravel /usr/local/bin/
