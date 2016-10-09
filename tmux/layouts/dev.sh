#!/bin/shell


# +-----------------------+
# |                       |
# |                       |
# |                       |
# +-----------+-----------+
# |           |           |
# +-----------+-----------+



if [ ${xdg_tmux+x} ]; then
	tmux=tmux $xdg_tmux
else
	tmux=tmux
fi

$tmux new-session -d -n "Development"
#tmux new-window -n "Main"
$tmux split-window -v -p 20
$tmux select-pane -t 2
$tmux split-window -h
$tmux select-pane -t 1
$tmux -2 attach-session -d
