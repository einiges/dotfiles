#!/bin/zsh

path+=("$(ruby -e 'print Gem.user_dir')/bin")
path+=("$HOME/.local/bin")
export PATH
