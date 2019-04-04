#!/bin/sh

downloadUrl=$1
echo "==== Download url"
echo "${downloadUrl}"

installationPath="/programs"
echo "==== install path"
sudo mkdir -p ${installationPath}
echo ${installationPath}

echo "==== Download Wildfly"
cd ${installationPath}
sudo wget ${downloadUrl}
ls -1 ./

echo "==== Extract Wildfly"
wildflyArchName=`ls -1 wildfly*.tar.gz`
echo ${wildflyArchName}
sudo tar -xvzf ${wildflyArchName}
sudo rm ${wildflyArchName}

echo "==== Rename directory to wildfly"
wildflyDirName=`ls -1 ./ | grep '^wildfly'`
echo "${wildflyDirName}"
sudo mv ${wildflyDirName} wildfly

echo "==== Copy wildfly script"
sudo cp /vagrant/vagrant/ubuntu16/fs/programs/wildfly/bin/launch.sh /programs/wildfly/bin/launch.sh

echo "==== Copy wildfly default config"
sudo cp /vagrant/vagrant/ubuntu16/fs/etc/default/wildfly /etc/default/wildfly

echo "==== Add user and group"
sudo groupadd wildfly
sudo useradd -s /bin/false -g wildfly -d ${installationPath}/wildfly wildfly
sudo chown -R wildfly:wildfly ${installationPath}/wildfly

echo "==== Install wildfly.service"
sudo cp -r /vagrant/vagrant/ubuntu16/fs/etc/systemd/system/wildfly.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start wildfly
sudo systemctl status wildfly

echo "==== Enable Wildfly service"
sudo systemctl enable wildfly
