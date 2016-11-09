#!/bin/bash

# Developer home
DHOME=/home/dev
GROOVY_SRC_HOME=$1

# Make sure you give proper permissions to share the following folders
EXPORTED_DIRECTORIES=".m2 .gradle .lein .scala .groovy .grails .sdkman/archives .sdkman/candidates .sbt .nvm .intellij .ssh"

# This function exposes previous folders to the docker container
function exported_directories_string {
    str=""

    for d in $EXPORTED_DIRECTORIES; do
        mkdir -p "$HOME/$d"
    done

    for d in $EXPORTED_DIRECTORIES; do
	str+="-v $HOME/$d:$DHOME/$d "
    done

    echo $str
}

docker run -p 8080:8080 \
       -v $GROOVY_SRC_HOME:/home/dev/ws \
       $(exported_directories_string) \
       -v /etc/localtime:/etc/localtime:ro \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=${DISPLAY} \
       -it mgg/groovy-dev
