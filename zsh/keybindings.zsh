#!/bin/zsh

# Vim Mode
bindkey -v

#bindkey '\t' menu-expand-or-complete

bindkey '^n' history-substring-search-up
bindkey '^r' history-substring-search-down


bindkey -M vicmd "^?" vi-backward-delete-char

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Delete]=${terminfo[kdch1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]] && bindkey "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]] && bindkey "${key[End]}"      end-of-line
[[ -n "${key[Delete]}"   ]] && bindkey "${key[Delete]}"   delete-char
[[ -n "${key[PageUp]}"   ]] && bindkey "${key[PageUp]}"   up-line-or-history
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" down-line-or-history


