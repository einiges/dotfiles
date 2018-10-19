ZGEN_DIR="${XDG_CACHE_HOME}/zsh/zgen"
ZGEN_INIT="${XDG_CACHE_HOME}/zsh/zgen-plugins-loader.zsh"

# zgen completion
fpath+=($ZGEN_DIR)

zgen () {
	if [[ ! -s $ZGEN_DIR/zgen.zsh ]]; then
		mkdir -p ${ZGEN_DIR:h}
		git clone --recursive https://github.com/tarjoilija/zgen.git $ZGEN_DIR
	fi
	. $ZGEN_DIR/zgen.zsh
	zgen "$@"
}


for f in ${ZDOTDIR}/plugin-config/*.pre.zsh; do
	source $f
done

# Generate zgen init script if needed
# Static load plugins
source ${ZGEN_INIT} 2>/dev/null || {
	[[ -f ${ZDOTDIR}/.zcompdump ]] && rm -f ${ZDOTDIR}/.zcompdump

	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma/fast-syntax-highlighting
	zgen load rupa/z

	zgen oh-my-zsh plugins/fancy-ctrl-z
	zgen oh-my-zsh plugins/extract

	zgen load mafredri/zsh-async
	zgen load "$HOME/Projects/public/zsh-bdi"

	zgen save
}

for f in ${ZDOTDIR}/plugin-config/*.post.zsh; do
	source $f
done

