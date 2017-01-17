#!/usr/bin/env bash

# #########################
# ## Node Entrypoint ######
# #########################

tmux -2 new-session -d -s node
tmux rename-window -t node:0 'project'
tmux select-window -t node:0
tmux send-keys -t node:0 'cd' C-m

tmux -2 attach-session -t node
