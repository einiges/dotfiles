

# Set window title, when waiting for command
function title_idle {
	print -Pn "\e]0;%(1j,%j job%(2j|s|); ,)%~\a"
}

# Set title when executing a command
function title_work {
	printf "\033]0;%s\a" "$1"
}

add-zsh-hook precmd  title_idle
add-zsh-hook preexec title_work


function dircolors-static {
	if [[ -v DIRCOLORS && -v DIRCOLORS_STATIC ]]; then
		dircolors "$DIRCOLORS" > "$DIRCOLORS_STATIC"
	else
		return 1
	fi
}
