#!/bin/sh

scriptName=$0
scriptDir=`dirname ${scriptName}`
echo ${scriptDir}

${scriptDir}/git-use-faqdev-bitbucket.sh
git push

${scriptDir}/git-use-faqdev-github.sh
git push

${scriptDir}/git-use-faqdev-gitlab.sh
git push
