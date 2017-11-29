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
	[ -f ${ZDOTDIR}/.zcompdump ] && rm -f ${ZDOTDIR}/.zcompdump

	zgen load "zsh-users/zsh-history-substring-search"
	zgen load "zdharma/fast-syntax-highlighting"
	zgen load "zsh-users/zsh-autosuggestions"
	zgen load "hlissner/zsh-autopair"
	zgen load "Tarrasch/zsh-bd"
	zgen load "arzzen/calc.plugin.zsh"

	zgen oh-my-zsh "plugins/wd"
	zgen oh-my-zsh "plugins/fancy-ctrl-z"
	zgen oh-my-zsh "plugins/extract"

	zgen load "mafredri/zsh-async"
	zgen load "Shrvi/nspure"

	zgen save
fi

# Static load plugins
. ${ZGEN_INIT}

plugin_hook_dir="${ZDOTDIR}/zshrc.d/plugin-hooks"

if [ -d ${plugin_hook_dir} ]; then
	for h in ${plugin_hook_dir}/?*.zsh ; do
		 [ -f "$h" ] && [ $(command stat -c '%U' "$h") = "$USER" ] && . "$h"
	done
	unset h
fi

unset plugin_hook_dir

