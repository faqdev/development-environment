#!/bin/sh

numberOfJdkFiles=`ls -1 /vagrant/downloads/jdk*.deb | wc -l`
echo "==== number of JDK files"
echo ${numberOfJdkFiles}

if [ "${numberOfJdkFiles}" != "1" ]; then
    echo "Please put only one JDK *.deb file to /vagrant/downloads folder"
    exit 1
fi

numberOfInstalledJdks=`find /usr/lib/jvm -name 'javac' | wc -l`
echo "==== number of installed JDKs"
echo ${numberOfInstalledJdks}

if [ "${numberOfInstalledJdks}" != "0" ]; then
    echo "The ${numberOfInstalledJdks} installed JDK(s) found. Please recreate VM"
    exit 1
fi

lastFileName=`ls -1 /vagrant/downloads/jdk*.deb`
echo "==== JDK file name"
echo "${lastFileName}"

echo "==== install ${lastFileName}"
sudo apt-get install -y ${lastFileName}

echo "==== get java directory"
javacPath=`find /usr/lib/jvm -name 'javac'`
javacPath=`dirname ${javacPath}`
echo ${javacPath}

echo "==== go to /home/vagrant"
cd /home/vagrant

echo "==== backup"
envFilePath="./environment"
. /etc/environment
echo -n 'PATH="' > ${envFilePath}
echo -n $PATH >> ${envFilePath}
echo -n ':' >> ${envFilePath}
echo -n ${javacPath} >> ${envFilePath}
echo '"' >> ${envFilePath}
cat ${envFilePath}
sudo cp ${envFilePath} /etc/environment

echo "==== add /usr/lib/jvm/default-jdk link"
jdkName=`ls -1 /usr/lib/jvm | grep '^jdk'`
jdkPath="/usr/lib/jvm/${jdkName}"
sudo ln -s ${jdkPath} /usr/lib/jvm/default-jdk
