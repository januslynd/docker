#!/bin/bash

# #########################
# ## Default Entrypoint ###
# #########################

tmux -2 new-session -d -s jvm

tmux rename-window -t jvm:0 'mgg/jvm'
tmux select-window -t jvm:0
tmux send-keys -t jvm 'echo "HELLO"' C-m

tmux -2 attach-session -t jvm
