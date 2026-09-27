function output_begin_marker {
	print -Pn "\e]133;C\e\\"
}

function output_end_marker {
	print -Pn "\e]133;D\e\\"
}

function prompt_marker {
	print -Pn "\e]133;A\e\\"
}

add-zsh-hook precmd output_end_marker
add-zsh-hook precmd prompt_marker
add-zsh-hook preexec output_begin_marker
