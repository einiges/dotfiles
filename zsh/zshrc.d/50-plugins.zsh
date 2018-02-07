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
	zgen load "arzzen/calc.plugin.zsh"
	zgen load "rupa/z"

	zgen oh-my-zsh "plugins/fancy-ctrl-z"
	zgen oh-my-zsh "plugins/extract"

	zgen load "mafredri/zsh-async"
	zgen load "$HOME/projects/public/nspure"
	zgen load "$HOME/projects/public/zsh-bdi"

	zgen save
fi

plugin_hook_dir="${ZDOTDIR}/zshrc.d/plugin-hooks"

if [[ -d ${plugin_hook_dir} ]]; then
	for h in ${plugin_hook_dir}/?*.pre.zsh ; do
		 [[ -f "$h" && $(zstat +uid "$h") == "$UID" ]] && . "$h"
	done
	unset h
fi

# Static load plugins
. ${ZGEN_INIT}


if [[ -d ${plugin_hook_dir} ]]; then
	for h in ${plugin_hook_dir}/?*.post.zsh ; do
		 [[ -f "$h" && $(zstat +uid "$h") == "$UID" ]] && . "$h"
	done
	unset h
fi

unset plugin_hook_dir

