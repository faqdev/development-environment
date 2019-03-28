#!/bin/sh

scriptName=$0
scriptDir=`dirname ${scriptName}`
echo ${scriptDir}

${scriptDir}/git-use-bitbucket.sh
git push

${scriptDir}/git-use-github.sh
git push

${scriptDir}/git-use-gitlab.sh
git push
