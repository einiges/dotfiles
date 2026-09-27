function {

# Vim Mode
bindkey -v

autoload kill-word-match && zle -N $_
autoload backward-kill-word-match && zle -N $_

# Complete word before cursor
bindkey '\t' expand-or-complete-prefix

# generate keyfile with 'autoload zkbd && zkbd'
local kbdfile="${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE"
if [[ ! -f "$kbdfile" ]]
then return 0
else source "$kbdfile"
fi


zkbdbind() {
	if (( # < 2)) || [[ ! -n "$1" ]]
	then return 1
	fi

	if (( # == 2 ))
	then bindkey "$@"
	else bindkey "${@:2}"
	fi
}

zkbdbind $key[Backspace]    backward-delete-char
zkbdbind $key[C-Backspace]  backward-delete-word

zkbdbind $key[S-Tab]        reverse-menu-complete

zkbdbind $key[Delete]       delete-char
zkbdbind $key[C-Delete]     delete-word

zkbdbind $key[Insert]       overwrite-mode

zkbdbind $key[Home]         beginning-of-line
zkbdbind $key[Home]         -M vicmd $key[Home] vi-beginning-of-line

zkbdbind $key[End]          end-of-line
zkbdbind $key[End]          -M vicmd $key[End] vi-end-of-line

zkbdbind $key[Up]           up-line-or-history

zkbdbind $key[Left]         backward-char
zkbdbind $key[C-Left]       backward-word

zkbdbind $key[Down]         down-line-or-history

zkbdbind $key[Right]        forward-char
zkbdbind $key[C-Right]      forward-word
}

