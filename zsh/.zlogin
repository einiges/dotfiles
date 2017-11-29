#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
	if [ -n "$XAUTHORITY" ] && [ ! -d "${XAUTHORITY:h}" ]; then
		mkdir -p ${XAUTHORITY:h}
	fi
	startx "$XINITRC"
	logout
fi

