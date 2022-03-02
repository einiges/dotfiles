# Keyboard Layout
setxkbmap -layout de -variant neo -option altwin:swap_lalt_lwin

# Alter existing layout
#xmodmap $XDG_CONFIG_HOME/X11/xmodmap

command -v xcape >/dev/null 2>&1 &&
	xcape -e 'ISO_Level3_Shift=Escape'

