
[[ -v EMACS ]] && return

case $TTY in
	/dev/ttyS[0-9]*) return ;;
esac

# Set window title, when waiting for command
function __title::idle {
	print -Pn -- '\e]0;%(1j,%j job%(2j|s|); ,)%~\a'
}

# Set title when executing a command
function __title::work {
	print -Pn -- '\e]0;${2:gs/%/%%/}\a'
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd  __title::idle
add-zsh-hook preexec __title::work

