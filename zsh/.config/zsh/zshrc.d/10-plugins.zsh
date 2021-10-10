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


# source plugin pre config
function {
for f in ${ZDOTDIR}/plugin/before/*.zsh(.,@N); do
	source $f
done
}

# Generate zgen init script if needed
# Static load plugins
source ${ZGEN_INIT} 2>/dev/null || {
	[[ -f ${ZDOTDIR}/.zcompdump ]] && rm -f ${ZDOTDIR}/.zcompdump

	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma/fast-syntax-highlighting
	zgen load zsh-users/zsh-completions src

	zgen load rupa/z

	zgen oh-my-zsh plugins/fancy-ctrl-z

	zgen load mafredri/zsh-async
	zgen load einiges/zsh-bdi

	zgen save
}

# source plugins post config
function () {
for f in ${ZDOTDIR}/plugin/after/*.zsh(.,@N); do
	source $f
done
}

