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

zplug "zsh-users/zsh-history-substring-search", \
	hook-load:"source $ZDOTDIR/hooks/history-substring-keys.zsh"
zplug "zsh-users/zsh-syntax-highlighting", \
	defer:2, \
	hook-load:"source $ZDOTDIR/hooks/syntax-highlighting-styles.zsh"


zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
zplug "arzzen/calc.plugin.zsh", hook-load: "unalias calc"

zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "plugins/git-prompt", from:oh-my-zsh, \
	hook-load:"source $ZDOTDIR/hooks/git-prompt.zsh"


# -- Load --

zplug load

