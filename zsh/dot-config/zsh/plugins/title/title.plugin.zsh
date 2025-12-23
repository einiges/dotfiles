
# Display $1 in terminal title.
function -title::set {
	emulate -L zsh
	if [[ -t 1 ]]; then
		print -rn -- $'\e]0;'${(V)1}$'\a'
	elif [[ -w $TTY ]]; then
		print -rn -- $'\e]0;'${(V)1}$'\a' >$TTY
	fi
}

function -title::work {
	-title::set $1
}

function -title::idle {
	-title::set ${(V%):-"%~"}
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec -title::work
add-zsh-hook precmd  -title::idle

