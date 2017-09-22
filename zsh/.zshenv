#!/bin/zsh


export BROWSER=firefox
export EDITOR=nvim
export TERMINAL=st
export PAGER=less

#export http_proxy="localhost:8118"

export TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'



# XDG
#export XDG_CONFIG_HOME=$HOME/.config       # -- /etc/zsh/zshenv --
#export  XDG_CACHE_HOME=$HOME/.cache
#export   XDG_DATA_HOME=$HOME/.local/share

# zsh
#export ZDOTDIR="$XDG_CONFIG_HOME"/zsh      # -- /etc/zsh/zshenv --

# dircolors
eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)

# alsa
#export ALSA_CONFIG_PATH=/usr/share/alsa/alsa.conf:"$XDG_CONFIG_HOME"/alsa/asoundrc
#export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME"/alsa/asoundrc

# X11
export    XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_CACHE_HOME"/X11/xauthority

# GnuPG
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GPG_TTY="$(tty)"

# urxvtd
export RXVT_SOCKET="$XDG_CACHE_HOME"/urxvt/urxvtd-"$(hostname)"

# history
export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE="$XDG_DATA_HOME/${SHELL##*/}"/history

# pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password-store
export PASSWORD_STORE_CLIP_TIME=7

# less
export LESSHISTFILE="$XDG_DATA_HOME"/less/history
export      LESSKEY="$XDG_CONFIG_HOME"/less/keys
export   LESSKEYDEF="$XDG_CONFIG_HOME"/less/keydef #*

# mysql
export     MYSQL_HOME="$XDG_CONFIG_HOME"/mysql
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql/history

# calc
export CALCRC="$XDG_CONFIG_HOME"/calc/calcrc

# irb
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# mplayer
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer

# gimp
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME"/gimp

# vimperator (Firefox Plugin)
export VIMPERATOR_RUNTIME="$XDG_CONFIG_HOME"/vimperator
export VIMPERATOR_INIT=":source $VIMPERATOR_RUNTIME/vimperatorrc"

# KDE
export KDEHOME="$XDG_CONFIG_HOME"/kde

# TeX
#export TEXMFHOME="$XDG_DATA_HOME"/texlive

# Ruby Gems
#export GEM_HOME="$XDG_DATA_HOME"/gem
#export GEM_PATH="$XDG_DATA_HOME"/gem


# One global setting with script support
# $xdg_prog
export    xdg_abcde="-c $XDG_CONFIG_HOME/abcde/abcde.conf"
export    xdg_abook="--config $XDG_CONFIG_HOME/abook/abookrc --datafile $XDG_DATA_HOME/abook/addressbook"
export     xdg_anki="-b $XDG_DATA_HOME/anki"
export xdg_calcurse="-D $XDG_CONFIG_HOME/calcurse"
export    xdg_conky="--config=$XDG_CONFIG_HOME/conky/conkyrc"
export    xdg_irssi="--home=$XDG_CONFIG_HOME/irssi"
export   xdg_mbsync="--config $XDG_CONFIG_HOME/mbsync/mbsyncrc"
export     xdg_tmux="-f $XDG_CONFIG_HOME/tmux/tmux.conf"


