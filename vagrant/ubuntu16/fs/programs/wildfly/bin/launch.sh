#!/bin/sh

if [ "x$WILDFLY_HOME" = "x" ]; then
    WILDFLY_HOME=/programs/wildfly
fi

if [ "x$1" = "xdomain" ]; then
    echo 'Starting Wildfly in domain mode.'
    $WILDFLY_HOME/bin/domain.sh -c $2 -b $3
else
    echo 'Starting Wildfly in standalone mode.'
    $WILDFLY_HOME/bin/standalone.sh -c $2 -b $3
fi
