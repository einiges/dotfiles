#!/bin/zsh

path+=("$(ruby -e 'print Gem.user_dir')/bin")
path+=("$XDG_BIN_HOME")
export PATH

