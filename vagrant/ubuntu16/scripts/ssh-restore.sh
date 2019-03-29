#!/bin/sh

echo "==== ~/.ssh"
ls -l ~/.ssh
echo "==== Copy files to ~/.ssh ..."
ls -l /vagrant/.ssh/
cp /vagrant/.ssh/* ~/.ssh/
echo "==== ~/.ssh"
ls -l ~/.ssh

if [ ! -e ~/.ssh/config ]; then
    echo "==== copy /vagrant/vagrant/ubuntu16/fs/home/vagrant/.ssh/config"
    cp /vagrant/vagrant/ubuntu16/fs/home/vagrant/.ssh/config ~/.ssh/config
fi

echo "==== ~/.ssh"
ls -l ~/.ssh
