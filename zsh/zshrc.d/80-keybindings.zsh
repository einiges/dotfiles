#!/bin/zsh

# Vim Mode
bindkey -v

bindkey "^[[4~"    end-of-line           # End
bindkey "^[[5~"    backward-word         # PageUp/Prior
bindkey "^[[6~"    forward-word          # PageDown/Next

case $TERM in
	tmux* )
		bindkey "^[[1~"    beginning-of-line     # Home
		bindkey "^[[3~"    delete-char           # Delete
		;;
	st* )
		bindkey "^[[H"     beginning-of-line     # Home
		bindkey "^[[P"     delete-char           # Delete
		;;
esac

