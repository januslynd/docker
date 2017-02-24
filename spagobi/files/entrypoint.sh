#!/bin/bash

# #########################
# ## Default Entrypoint ###
# #########################

tmux -2 new-session -d -s spagobi

tmux rename-window -t spagobi:0 'mgg/spagobi'
tmux select-window -t spagobi:0
tmux send-keys -t spagobi './bin/SpagoBIStartup.sh' C-m

tmux -2 attach-session -t spagobi
