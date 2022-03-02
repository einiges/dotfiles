
export BROWSER=firefox
export EDITOR=nvim
export PAGER=less
export TERMINAL=st

export TIMEFMT=$'%E real     %U user     %S sys'

# XDG
[[ -v XDG_CONFIG_HOME ]] || export XDG_CONFIG_HOME="$HOME"/.config
[[ -v XDG_CACHE_HOME  ]] || export  XDG_CACHE_HOME="$HOME"/.cache
[[ -v XDG_DATA_HOME   ]] || export   XDG_DATA_HOME="$HOME"/.local/share
[[ -v XDG_STATE_HOME  ]] || export  XDG_STATE_HOME="$HOME"/.local/state

export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"

# zsh
[[ -v ZDOTDIR ]] || export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

KEYTIMEOUT=10
WORDCHARS="?_-.~;!#$%^"

