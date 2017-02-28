#!/bin/zsh


ZPLUG_REPOS=$XDG_CACHE_HOME/zsh/plugins
ZPLUG_HOME=$ZPLUG_REPOS/zplug/zplug

if [ ! -d $ZPLUG_HOME ]; then
	return
fi



# -- Init --

source $ZPLUG_HOME/init.zsh



# -- Select --

zplug "zplug/zplug"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", \
	defer:2, \
	hook-load:"[ -f $ZDOTDIR/hooks/syntax-highlighting-styles.zsh ] && source $ZDOTDIR/hooks/syntax-highlighting-styles.zsh"


zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
zplug "arzzen/calc.plugin.zsh", hook-load: "unalias calc"

zplug "plugins/fancy-ctrl-z", from:oh-my-zsh


# -- Load --

zplug load

