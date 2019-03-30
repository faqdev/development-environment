#!/bin/sh

scriptName=$0
scriptDir=`dirname ${scriptName}`
echo "==== Script dir"
echo ${scriptDir}
cd ${scriptDir}/..

echo "==== Current branch ..."
currentBranch=`git branch | grep '^*' | awk '{print $2;}'`
echo ${currentBranch}

echo "==== Save to BitBucket ..."
${scriptDir}/git-use-faqdev-bitbucket.sh
git push -f --set-upstream origin ${currentBranch}

echo "==== Save to GitHub ..."
${scriptDir}/git-use-faqdev-github.sh
git push -f --set-upstream origin ${currentBranch}

echo "==== Save to GitLab ..."
${scriptDir}/git-use-faqdev-gitlab.sh
git push -f --set-upstream origin ${currentBranch}
