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
	nice:19, \
	hook-load:"[ -f $ZDOTDIR/hooks/syntax-highlighting-styles.zsh ] && source $ZDOTDIR/hooks/syntax-highlighting-styles.zsh"


zplug "zsh-users/zsh-completions"



# -- Load --

zplug load
