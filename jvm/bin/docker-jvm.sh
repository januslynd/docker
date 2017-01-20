#!/bin/bash

#    ___             _         _    _          _         _
#   | _ \_  _ _ _   (_)_ _  __(_)__| |___   __| |___  __| |
#   |   / || | ' \  | | ' \(_-< / _` / -_) / _` / _ \/ _| / / -_) '_|
#   |_|_\\_,_|_||_| |_|_||_/__/_\__,_\___| \__,_\___/\__|_\_\___|_|
#
# 1) Put this in your $PATH
# 2) Go to your JVM project folder
# 3) Execute rocker.sh
# 4) Profit!
#

# Developer home
DHOME=/home/dev

# Make sure you give proper permissions to share the following folders
EXPORTED_DIRECTORIES=".m2 .gradle .lein .scala .groovy .grails .sdkman/archives .sdkman/candidates .sbt .nvm .intellij"

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

# Create container with shared X
docker run -it \
       -p $1:$1\
       -p 3449:3449 \
       -v $(pwd):/home/dev/ws \
       $(exported_directories_string) \
       -v /etc/localtime:/etc/localtime:ro \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=unix$DISPLAY \
       mgg/jvm
