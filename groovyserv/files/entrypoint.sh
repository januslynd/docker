#!/usr/bin/env bash

set -e

echo "Setting GroovyServ variables..."
GROOVYSERV_PORT=${GROOVYSERV_PORT:-"9999"}
GROOVYSERV_LOG_DIR=${GROOVYSERV_LOG_DIR:-"$GROOVYSERV_PATH/log/"}
GROOVYSERV_WORK_DIR=${GROOVYSERV_WORK_DIR:-"$GROOVYSERV_PATH/work/"}
GROOVYSERV_AUTHTOKEN=${GROOVYSERV_AUTHTOKEN:-"secrettoken"}

export GROOVYSERV_LOG_DIR
export GROOVYSERV_WORK_DIR

echo "Setting up GroovyServ..."
$GROOVYSERV_PATH/groovyserv-$GROOVYSERV_VERSION/bin/setup.sh

echo "Starting GroovyServ..."
groovyserver --debug -p $GROOVYSERV_PORT --authtoken $GROOVYSERV_AUTHTOKEN -v -t 1000

echo "Keeping container alive"
tail -f $GROOVY_HOME/LICENSE
