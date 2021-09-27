
# Go to $OLDPWD without putting it in $(dirs) so it does not get flooded.

oldpwd() {
	unsetopt local_options pushd_minus

	IFS=$'\n' ds=( $(dirs -lp) )

	[[ "$ds[-1]" == "$OLDPWD" ]] &&
		builtin popd -q +0 ||
		builtin pushd ~-
}

alias .,='oldpwd'

