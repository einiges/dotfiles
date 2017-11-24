#!/bin/zsh


ZPLUG_REPOS=$XDG_CACHE_HOME/zsh/plugins
ZPLUG_HOME=$ZPLUG_REPOS/zplug/zplug

[ ! -d $ZPLUG_HOME ] && return


# -- Init --

. $ZPLUG_HOME/init.zsh



# -- Select --

zplug "zplug/zplug"

zplug "zsh-users/zsh-history-substring-search", \
	hook-load:". $ZDOTDIR/hooks/history-substring-keys.zsh"
zplug "zsh-users/zsh-syntax-highlighting", \
	defer:2, \
	hook-load:". $ZDOTDIR/hooks/syntax-highlighting-styles.zsh"

zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "arzzen/calc.plugin.zsh"

zplug "mafredri/zsh-async"
zplug "Shrvi/nspure", as:theme, \
	hook-load:". $ZDOTDIR/hooks/nspurer.zsh"


# -- Load --

zplug load

