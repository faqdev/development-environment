#!/bin/sh

numberOfTomcatFiles=`ls -1 /vagrant/downloads/apache-tomcat*.tar.gz | wc -l`
echo "==== number of Tomcat files"
echo ${numberOfTomcatFiles}

if [ "${numberOfTomcatFiles}" != "1" ]; then
    echo "Please put only one apache-tomcat *.tar.gz file to /vagrant/downloads folder"
    exit 1
fi

installationPath="/programs"
echo "==== install path"
sudo mkdir -p ${installationPath}
echo ${installationPath}

numberOfInstalledTomcats=`ls -1 ${installationPath} | grep 'apache-tomcat' | wc -l`
echo "==== number of installed Tomcat(s)"
echo ${numberOfInstalledTomcats}

if [ "${numberOfInstalledTomcats}" != "0" ]; then
    echo "The ${numberOfInstalledTomcats} installed Tomcat(s) found. Please recreate VM"
    exit 1
fi

lastFileName=`ls -1 /vagrant/downloads/apache-tomcat*.tar.gz`
echo "==== Tomcat file name"
echo "${lastFileName}"

echo "==== extract ${lastFileName} to ${installationPath}"
sudo tar xfz ${lastFileName} -C ${installationPath}

echo "==== Tomcat path"
tomcatName=`ls -1 ${installationPath} | grep 'apache-tomcat'`
tomcatPath="${installationPath}/${tomcatName}"
echo ${tomcatPath}
sudo ln -s ${tomcatPath} ${installationPath}/tomcat

echo "==== Prepare tomcat user and group"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d ${tomcatPath} tomcat

echo "==== Prepare Tomcat service"
sudo chown -R tomcat:tomcat ${tomcatPath}
sudo cp -r /vagrant/vagrant/ubuntu16/fs/etc/systemd/system/tomcat.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat

echo "==== Enable Tomcat service"
sudo systemctl enable tomcat
