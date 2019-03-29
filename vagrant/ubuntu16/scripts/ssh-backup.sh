#!/bin/sh

sshBackupDir="/vagrant/.ssh"

echo "==== ${sshBackupDir}"
mkdir -p ${sshBackupDir}
ls -l ${sshBackupDir}

echo "==== Copy files ..."
cp ~/.ssh/config ${sshBackupDir}
cp ~/.ssh/id_rsa* ${sshBackupDir}

echo "==== ${sshBackupDir}"
ls -l ${sshBackupDir}
