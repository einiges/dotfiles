#!/bin/zsh

ZGEN_DIR="${XDG_CACHE_HOME}/zsh/zgen"
ZGEN_INIT="$ZDOTDIR/.zgen-plugins.zsh"

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

	zgen load "zsh-users/zsh-history-substring-search"
	zgen load "zsh-users/zsh-completions"
	zgen load "zdharma/fast-syntax-highlighting"
	zgen load "zsh-users/zsh-autosuggestions"

	zgen oh-my-zsh "plugins/fancy-ctrl-z"
	zgen oh-my-zsh "plugins/extract"
	zgen load "arzzen/calc.plugin.zsh"

	zgen load "mafredri/zsh-async"
	zgen load "Shrvi/nspure"

	zgen save
	zcompile $ZGEN_INIT
fi

# Static load plugins
. ${ZGEN_INIT}

if [ -d ${ZDOTDIR}/hooks ]; then
	for h in ${ZDOTDIR}/hooks/?*.zsh ; do
		[ -f "$h" ] && . "$h"
	done
	unset h
fi


