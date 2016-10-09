#!/bin/zsh

ZPLUG_HOME=$XDG_CACHE_HOME/zsh/zplug
#ZPLUG_ROOT=$ZPLUG_HOME/repos/zplug/zplug

#if [ ! -d $ZPLUG_ROOT ]; then
#	return
#fi

source $ZPLUG_HOME/init.zsh
#zplug "zplug/zplug"

# plugins
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", \
	nice:19, \
	hook-load:"[ -f $ZDOTDIR/hooks/syntax-highlighting-styles.zsh ] && source $ZDOTDIR/hooks/syntax-highlighting-styles.zsh"


zplug "zsh-users/zsh-completions"

#zplug "junegunn/fzf", \
#	nice:18, \
#	hook-build:"sh install --bin --64", \
#	hook-load:"[ -f $ZDOTDIR/hooks/fzf.zsh ] && source $ZDOTDIR/hooks/fzf.zsh"

zplug load


