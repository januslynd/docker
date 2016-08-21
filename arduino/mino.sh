#!/bin/bash

#      _          _      _            ___ ___  ___
#     /_\  _ _ __| |_  _(_)_ _  ___  |_ _|   \| __|
#    / _ \| '_/ _` | || | | ' \/ _ \  | || |) | _|
#   /_/ \_\_| \__,_|\_,_|_|_||_\___/ |___|___/|___|
#

# Create container with shared X
docker run -v /etc/localtime:/etc/localtime:ro \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=unix$DISPLAY \
       -it mgg/arduino
