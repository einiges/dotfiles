(( $+commands[dircolors-gen] )) &&
	[[ ! -f "$DIRCOLORS_INIT" ]] &&
	dircolors-gen

[[ -f "$DIRCOLORS_INIT" ]] &&
	source "$DIRCOLORS_INIT"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
