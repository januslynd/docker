#!/bin/bash

# #########################
# ## Start SSH service  ###
# #########################

sudo service ssh start

# #########################
# ## Default Entrypoint ###
# #########################

tmux -2 new-session -d -s openssh

tmux rename-window -t openssh:0 'mgg/openssh'
tmux select-window -t openssh:0
tmux send-keys -t openssh 'echo "HELLO"' C-m

tmux -2 attach-session -t openssh
