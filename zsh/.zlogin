#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
	if [ ! -z $XAUTHORITY ] && [ ! -d $(dirname $XAUTHORITY) ]; then
		mkdir -p $(dirname $XAUTHORITY)
	fi
	startx $XINITRC
	logout
fi

