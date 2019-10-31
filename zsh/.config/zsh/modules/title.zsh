
[[ -v EMACS ]] && return

case $TTY in
	/dev/ttyS[0-9]*) return ;;
esac


autoload -Uz add-zsh-hook

# Set window title, when waiting for command
function title_idle {
	print -Pn "\e]0;%(1j,%j job%(2j|s|); ,)%~\a"
}

# Set title when executing a command
function title_work {
	print -n "\e]0;$1\a"
}

add-zsh-hook precmd  title_idle
add-zsh-hook preexec title_work

