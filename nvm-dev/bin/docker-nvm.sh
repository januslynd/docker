#!/bin/bash

# Developer home
DHOME=/home/dev
NGINX_CONTENT=$1

# This function exposes previous folders to the docker container
function exported_directories_string {
    # Make sure you give proper permissions to share the following folders
    EXPORTED_DIRECTORIES=".intellij .ssh"
    str=""

    for d in $EXPORTED_DIRECTORIES; do
        mkdir -p "$HOME/$d"
    done

    for d in $EXPORTED_DIRECTORIES; do
	str+="-v $HOME/$d:$DHOME/$d "
    done

    echo $str
}

function run_with_static_content {
  echo "Exposing $NGINX_CONTENT as static content (Cors enabled)"
    docker run -ti --rm \
       -p 80:80 \
       -e DISPLAY=unix${DISPLAY} \
       -v $(pwd):/home/dev/ws \
       -v /etc/localtime:/etc/localtime:ro \
       -v $NGINX_CONTENT:/usr/share/nginx/html \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       $(exported_directories_string) \
       mgg/nvm-dev
}

function run_simple {
  echo "Running simple environment"
    docker run -ti --rm \
       -p 80:80 \
       -e DISPLAY=unix${DISPLAY} \
       -v $(pwd):/home/dev/ws \
       -v /etc/localtime:/etc/localtime:ro \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       $(exported_directories_string) \
       mgg/nvm-dev
}

echo "Checking arguments..."


if [ -z $1 ] ; then
    run_simple
else
    if [ ! -e $1 ] ; then
        echo "The file $1 does not exist"
        exit 1
    else
        run_with_static_content
    fi
fi
