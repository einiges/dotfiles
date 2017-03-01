#!/bin/sh


# +-----------------------+
# |                       |
# |                       |
# |                       |
# +-----------+-----------+
# |           |           |
# +-----------+-----------+


t() {
	tmux $xdg_tmux "$@"
}


t new-session -d -n "Development"
t split-window -v -p 20
t select-pane -t 2
t split-window -h
t select-pane -t 1
t -2 attach-session -d
