#!/bin/zsh

path+=("$(ruby -e 'print Gem.user_dir')/bin")
export PATH

