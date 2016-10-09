#!/bin/zsh

# Vim Mode
bindkey -v

#bindkey '\t' menu-expand-or-complete

bindkey '^n' history-substring-search-up
bindkey '^r' history-substring-search-down


bindkey -M vicmd "^?" vi-backward-delete-char

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Delete]=${terminfo[kdch1]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char



# Make ^Z toggle between ^Z and fg
function ctrlz() 
{
	if [[ $#BUFFER == 0 ]]; then
		fg >/dev/null 2>&1 && zle redisplay
	else
		zle push-input
	fi
}

zle -N ctrlz
bindkey '^Z' ctrlz

