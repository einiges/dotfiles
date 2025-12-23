function {

# Vim Mode
bindkey -v

autoload kill-word-match && zle -N $_
autoload backward-kill-word-match && zle -N $_

# Complete word before cursor
bindkey '\t' expand-or-complete-prefix

# generate keyfile with 'autoload zkbd && zkbd'
local kbdfile="$ZDOTDIR/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"
[[ ! -f "$kbdfile" ]] && return 0


source "$kbdfile"

test -n "${key[Backspace]}"    && bindkey $_ backward-delete-char
test -n "${key[C-Backspace]}"  && bindkey $_ backward-delete-word

test -n "${key[S-Tab]}"        && bindkey $_ reverse-menu-complete

test -n "${key[Delete]}"       && bindkey $_ delete-char
test -n "${key[C-Delete]}"     && bindkey $_ delete-word

test -n "${key[Insert]}"       && bindkey $_ overwrite-mode

test -n "${key[Home]}"         && bindkey $_ beginning-of-line
test -n "${key[Home]}"         && bindkey -M vicmd $_ vi-beginning-of-line

test -n "${key[End]}"          && bindkey $_ end-of-line
test -n "${key[End]}"          && bindkey -M vicmd $_ vi-end-of-line

test -n "${key[Up]}"           && bindkey $_ up-line-or-history

test -n "${key[Left]}"         && bindkey $_ backward-char
test -n "${key[C-Left]}"       && bindkey $_ backward-word

test -n "${key[Down]}"         && bindkey $_ down-line-or-history

test -n "${key[Right]}"        && bindkey $_ forward-char
test -n "${key[C-Right]}"      && bindkey $_ forward-word

}
