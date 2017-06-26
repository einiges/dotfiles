#!/bin/zsh


#autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
autoload -U colors && colors
#autoload -U promptinit && promptinit

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


# Run TMUX by default
# -------------------
#if command -v tmux>/dev/null; then
#	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi


# Share command status and print in titlebar
# Write some info to terminal title.
# This is seen when the shell prompts for input.
function precmd { print -Pn "\e]0;%(1j,%j job%(2j|s|); ,)%~\a" }

# Write command and args to terminal title.
# This is seen while the shell waits for a command to complete.
function preexec { printf "\033]0;%s\a" "$1" }

if [[ $TERM =~ "(st|screen)-256color" ]]; then
	function zle-line-init () { echoti smkx }
	function zle-line-finish () { echoti rmkx }
	zle -N zle-line-init
	zle -N zle-line-finish
fi

test -f $ZDOTDIR/plugins.zsh    && . $_
test -f $ZDOTDIR/aliases.zsh    && . $_
test -f $ZDOTDIR/dirhashes.zsh  && . $_
test -f $ZDOTDIR/completions.zsh && . $_
test -f $ZDOTDIR/keybindings.zsh && . $_
test -f $ZDOTDIR/prompts.zsh     && . $_



