#!/bin/zsh

ZGEN_DIR="${XDG_CACHE_HOME}/zsh/zgen"
ZGEN_INIT="${XDG_CACHE_HOME}/zsh/zgen-plugins-loader.zsh"

zgen () {
	if [[ ! -s $ZGEN_DIR/zgen.zsh ]]; then
		mkdir -p ${ZGEN_DIR:h}
		git clone --recursive https://github.com/tarjoilija/zgen.git $ZGEN_DIR
	fi
	. $ZGEN_DIR/zgen.zsh
	zgen "$@"
}


# Generate zgen init script if needed
if [[ ! -s "$ZGEN_INIT" ]]; then
	[[ -f ${ZDOTDIR}/.zcompdump ]] && rm -f ${ZDOTDIR}/.zcompdump

	zgen load "zsh-users/zsh-history-substring-search"
	zgen load "zsh-users/zsh-autosuggestions"
	zgen load "zdharma/fast-syntax-highlighting"
	zgen load "rupa/z"

	zgen oh-my-zsh "plugins/fancy-ctrl-z"
	zgen oh-my-zsh "plugins/extract"

	zgen load "mafredri/zsh-async"
	zgen load "$HOME/Projects/public/zsh-bdi"

	zgen save
fi

for f in ${ZDOTDIR}/plugin-config/*.pre.zsh; do
	source $f
done

# Static load plugins
. ${ZGEN_INIT}


for f in ${ZDOTDIR}/plugin-config/*.post.zsh; do
	source $f
done

