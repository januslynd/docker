#!/usr/bin/env bash

# #########################
# ## Node Entrypoint ######
# #########################

tmux -2 new-session -d -s node
tmux rename-window -t node:0 'project'
tmux select-window -t node:0

tmux new-window -t node
tmux rename-window -t node:1 'nginx'
tmux select-window -t node:1
tmux send-keys -t node 'sudo nginx' C-m

tmux select-window -t node:0
tmux -2 attach-session -t node
