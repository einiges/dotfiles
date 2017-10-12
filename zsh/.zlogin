#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
	if [ -n "$XAUTHORITY" ] && [ ! -d $(dirname "$XAUTHORITY") ]; then
		mkdir -p $(dirname $XAUTHORITY)
	fi
	startx "$XINITRC"
	logout
fi

