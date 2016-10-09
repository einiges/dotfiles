#!/bin/zsh


#autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
autoload -U colors && colors
autoload -U promptinit && promptinit

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

setopt AUTOCD               # dir = cd dir
setopt AUTO_PUSHD           # cd = pushd
setopt PUSHD_SILENT         # disable pushd stack message 
setopt PUSHD_TO_HOME        # pushd = pushd ~
setopt PUSHD_MINUS          # change pushd +2 to -2 and - to +
#setopt PUSHD_IGNORE_DUPS    # ignore dups in stack

setopt PROMPT_SUBST
setopt AUTO_NAME_DIRS
setopt RM_STAR_WAIT         # Wait 10 sec before delete *
setopt CORRECT              # correct me
unsetopt CORRECT_ALL        # but not to much
setopt NO_BEEP
#setopt NO_AUTO_REMOVE_SLASH


setopt HIST_EXPIRE_DUPS_FIRST  # -- History --
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY


# Run TMUX by default
# -------------------
#if command -v tmux>/dev/null; then
#	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi


# Share command status and print in titlebar
case $TERM in
	(*xterm* | rxvt-unicode-256color)
		# Write some info to terminal title.
		# This is seen when the shell prompts for input.
		function precmd {
		#print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
		print -Pn "\e]0;%(1j,%j job%(2j|s|); ,)%~\a"
	}
	# Write command and args to terminal title.
	# This is seen while the shell waits for a command to complete.
	function preexec {
	printf "\033]0;%s\a" "$1"
}
;;
esac

#for (( i=1; i<=$LINES; i++ )); do echo; done; clear

test -f $ZDOTDIR/plugins.zsh    && . $_
test -f $ZDOTDIR/functions.zsh  && . $_
test -f $ZDOTDIR/aliases.zsh    && . $_
test -f $ZDOTDIR/dirhashes.zsh  && . $_
test -f $ZDOTDIR/completion.zsh && . $_
test -f $ZDOTDIR/keybinding.zsh && . $_
test -f $ZDOTDIR/prompt.zsh     && . $_



