ZGEN_DIR="${XDG_CACHE_HOME}/zsh/zgen"
ZGEN_INIT="${XDG_CACHE_HOME}/zsh/zgen-plugins-loader.zsh"

# zgen completion
fpath+=$ZGEN_DIR

function zgen {
	if [[ ! -f $ZGEN_DIR/zgen.zsh ]]; then
		git clone --recursive https://github.com/tarjoilija/zgen.git $ZGEN_DIR
	fi
	source $ZGEN_DIR/zgen.zsh
	zgen "$@"
}


for f ( ${ZDOTDIR}/plugin-config/*.pre.zsh(.,@N) ) source $f

# Generate zgen init script if needed
# Static load plugins
source ${ZGEN_INIT} 2>/dev/null || {
	[[ -f ${ZDOTDIR}/.zcompdump ]] && rm -f ${ZDOTDIR}/.zcompdump

	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma/fast-syntax-highlighting
	zgen load zsh-users/zsh-completions src

	zgen oh-my-zsh plugins/fancy-ctrl-z

	zgen load mafredri/zsh-async
	zgen load einiges/zsh-bdi

	zgen save
}

for f ( ${ZDOTDIR}/plugin-config/*.post.zsh(.,@N) ) source $f

