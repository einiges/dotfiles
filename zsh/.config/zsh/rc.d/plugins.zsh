ZGEN_DIR="$XDG_CACHE_HOME"/zsh/zgen
ZGEN_INIT="$XDG_CACHE_HOME"/zsh/zgen-plugins-loader.zsh

# zgen completion
fpath+="$ZGEN_DIR"

function zgen {
	if [[ ! -f "$ZGEN_DIR"/zgen.zsh ]]; then
		git clone --recursive https://github.com/tarjoilija/zgen.git "$ZGEN_DIR"
	fi
	source "$ZGEN_DIR"/zgen.zsh
	zgen "$@"
}


# source plugin pre config
function {
local src
for src in "$ZDOTDIR"/plugins.conf.d/pre/*.zsh(.,@N); do
	source "$src"
done
}

# Generate zgen init script if needed
# Static load plugins
source "$ZGEN_INIT" &>/dev/null || {
	[[ -f "$ZDOTDIR"/.zcompdump ]] && rm -f "$ZDOTDIR"/.zcompdump

	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma-continuum/fast-syntax-highlighting
	zgen load zsh-users/zsh-completions src
	zgen load agkozak/zsh-z

	zgen load romkatv/powerlevel10k powerlevel10k
	#zgen load mafredri/zsh-async

	zgen load "$ZDOTDIR"/plugins/fancier-ctrl-z
	[[ -d "$HOME"/Workspace/zsh/zsh-bdi ]] &&
		zgen load "$HOME"/Workspace/zsh/zsh-bdi ||
		zgen load einiges/zsh-bdi

	zgen save
}

# source plugins post config
function {
local src
for src in "$ZDOTDIR"/plugins.conf.d/post/*.zsh(.,@N); do
	source "$src"
done
}

