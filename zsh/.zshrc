#!/bin/zsh


#autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
autoload -U colors && colors
autoload -Uz add-zsh-hook

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

setopt autocd               # dir = cd dir
setopt auto_pushd           # cd = pushd
setopt pushd_silent         # disable pushd stack message
setopt pushd_to_home        # pushd = pushd ~
setopt pushd_minus          # change pushd +2 to -2 and - to +
#setopt pushd_ignore_dups    # ignore dups in stack

setopt prompt_subst
setopt auto_name_dirs
setopt rm_star_wait         # Wait 10 sec before delete *
setopt correct              # correct me
unsetopt correct_all        # but not to much
setopt no_beep


setopt hist_expire_dups_first  # -- History --
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history
setopt inc_append_history


if [ -d ${ZDOTDIR}/zshrc.d ]; then
	for h in ${ZDOTDIR}/zshrc.d/?*.zsh ; do
		 [ -f "$h" ] && [ $(command stat -c '%U' "$h") = "$USER" ] && . "$h"
	done
	unset h
fi


