[[ ! -v DISPLAY && $XDG_VTNR -eq 1 ]] &&
	startx "$XINITRC" -- "$SERVERRC" vt1
	#exec startx "$XINITRC" -- "$SERVERRC" vt1
