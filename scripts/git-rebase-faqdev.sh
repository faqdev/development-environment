#!/bin/sh

currentBranch=`git branch | grep '^*' | awk '{print $2;}'`
echo "==== Current branch: ${currentBranch}"

set -x -e

git checkout master

prevBranch="master"
for branchName in `git branch | grep -v '* master'`; do
    echo "==== ${branchName}"
    git checkout ${branchName}
    git rebase ${prevBranch}
    git push -f
    prevBranch="${branchName}"
done

echo "==== Switching to ${currentBranch} ..."
git checkout ${currentBranch}
