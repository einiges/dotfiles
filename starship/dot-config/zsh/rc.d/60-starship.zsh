(( ! $+commands[starship] )) && return

[[ ! -f "$STARSHIP_INIT" ]] &&
	command starship init zsh >! "$STARSHIP_INIT"

source "$STARSHIP_INIT"
