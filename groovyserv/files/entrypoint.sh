#!/usr/bin/env bash

set -e
set -x

echo "Setting GroovyServ variables..."
GROOVYSERV_PORT=${GROOVYSERV_PORT:-"9999"}
GROOVYSERV_LOG_DIR=${GROOVYSERV_LOG_DIR:-"/var/log/"}
GROOVYSERV_WORK_DIR=${GROOVYSERV_WORK_DIR:-"/opt/groovyserv/auth/"}
GROOVYSERV_AUTHTOKEN=${GROOVYSERV_AUTHTOKEN:-"secrettoken"}

export GROOVYSERV_LOG_DIR
export GROOVYSERV_WORK_DIR

echo "Starting GroovyServ..."
groovyserver --debug -p $GROOVYSERV_PORT --authtoken $GROOVYSERV_AUTHTOKEN -v -t 1000

echo "Starting fake Xorg server"
Xvfb :10 -ac
