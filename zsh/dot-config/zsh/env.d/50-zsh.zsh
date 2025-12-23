# vim: ft=zsh

# XDG
#[[ -v XDG_CONFIG_HOME ]] || export XDG_CONFIG_HOME="$HOME"/.config
#[[ -v XDG_CACHE_HOME  ]] || export  XDG_CACHE_HOME="$HOME"/.cache
#[[ -v XDG_DATA_HOME   ]] || export   XDG_DATA_HOME="$HOME"/.local/share
#[[ -v XDG_STATE_HOME  ]] || export  XDG_STATE_HOME="$HOME"/.local/state

# history
SAVEHIST=50000
HISTSIZE=50000
HISTFILE="$XDG_STATE_HOME/${SHELL##*/}"/history

KEYTIMEOUT=10
WORDCHARS="?_-.~;!#$%^"


export BROWSER=firefox
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export TERMINAL=kitty

export TIMEFMT=$'%E real     %U user     %S sys'


# pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password-store
export PASSWORD_STORE_CLIP_TIME=3
export PASSWORD_STORE_X_SELECTION=primary

# gtk
#export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
#export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# TeX
export TEXMFHOME="$XDG_DATA_HOME"/texlive/texmf
export TEXMFCONFIG="$XDG_DATA_HOME"/texlive/texmf-config
export TEXMFVAR="$XDG_DATA_HOME"/texlive/texmf-var

# Go
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

# grim
#export GRIM_DEFAULT_DIR="${HOME}/Pictures/Screenshots"
#export GRIM_DEFAULT_DIR="(xdg-user-dir PICTURES)/Screenshots"

# Java
export JAVA_HOME=/usr/lib/jvm/default
