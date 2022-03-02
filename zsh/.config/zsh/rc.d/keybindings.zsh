autoload backward-kill-word-match
zle -N backward-kill-word-match

autoload kill-word-match
zle -N kill-word-match

# Vim Mode
bindkey -v

# Complete word before cursor
bindkey '\t' expand-or-complete-prefix


# FIXME: Why does tmux receives different sequences?
keyfile=${ZDOTDIR}/keydef/${TERM}
[[ $TERM =~ '^tmux-.*' ]] &&
	keyfile+="_${$(tmux show-environment -g TERM)#*=}"

if [[ -f $keyfile ]]; then
	source $keyfile
	unset keyfile
else
	unset keyfile
	return
fi

[[ -n ${key[Backspace]} ]]    && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[C-Backspace]} ]]  && bindkey "${key[C-Backspace]}" backward-kill-word-match
[[ -n ${key[S-Backspace]} ]]  && bindkey "${key[S-Backspace]}" backward-delete-char
#[[ -n ${key[Insert]} ]]       && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]]         && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[Home]} ]]         && bindkey -M vicmd "${key[Home]}" vi-beginning-of-line
[[ -n ${key[PageUp]} ]]       && bindkey "${key[PageUp]}" backward-word
[[ -n ${key[Delete]} ]]       && bindkey "${key[Delete]}" delete-char
[[ -n ${key[C-Delete]} ]]     && bindkey "${key[C-Delete]}" kill-word-match
[[ -n ${key[S-Delete]} ]]     && bindkey "${key[S-Delete]}" delete-char
[[ -n ${key[End]} ]]          && bindkey "${key[End]}" end-of-line
[[ -n ${key[End]} ]]          && bindkey -M vicmd "${key[End]}" vi-end-of-line
[[ -n ${key[PageDown]} ]]     && bindkey "${key[PageDown]}" forward-word
[[ -n ${key[Up]} ]]           && bindkey "${key[Up]}" up-line-or-history
[[ -n ${key[S-Up]} ]]         && bindkey "${key[S-Up]}" up-history
[[ -n ${key[Left]} ]]         && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]]         && bindkey "${key[Down]}" down-line-or-history
[[ -n ${key[S-Down]} ]]       && bindkey "${key[S-Down]}" down-history
[[ -n ${key[Right]} ]]        && bindkey "${key[Right]}" forward-char
[[ -n ${key[S-Space]} ]]      && bindkey "${key[S-Space]}" magic-space
[[ -n ${key[S-Return]} ]]     && bindkey "${key[S-Return]}" accept-line

