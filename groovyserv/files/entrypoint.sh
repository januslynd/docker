#!/usr/bin/env bash

set -e

echo "Setting GroovyServ variables..."
GROOVYSERV_PORT=${GROOVYSERV_PORT:-"9999"}
GROOVYSERV_LOG_DIR=${GROOVYSERV_LOG_DIR:-"/var/log/"}
GROOVYSERV_WORK_DIR=${GROOVYSERV_WORK_DIR:-"/opt/groovyserv/auth/"}

export GROOVYSERV_LOG_DIR
export GROOVYSERV_WORK_DIR

echo "Setting up GroovyServ..."
/opt/groovyserv/groovyserv-$GROOVYSERV_VERSION/bin/setup.sh

echo "Starting GroovyServ..."
groovyserver --debug -p $GROOVYSERV_PORT -v -t 1000

echo "Starting fake Xorg server"
Xvfb :10 -ac
