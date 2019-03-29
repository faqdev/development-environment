#!/bin/sh

scriptName=$0
scriptDir=`dirname ${scriptName}`
echo ${scriptDir}

find ${scriptDir}/.. -name '*.sh' | awk '{print "chmod +x "$0}' | sh
