#!/bin/zsh

alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color'
alias -g W='| wc'
alias -g ∃='2> /dev/null'
alias -g ∀='> /dev/null 2>&1'

alias ,='popd'

# -- shorties --

alias l=${PAGER:-less}
alias m='neomutt'
alias n='nvim'
alias o='rifle'
alias p='print'
alias g='noglob git'
alias t='tmux'
alias ta='tmux attach -t'

alias  ls='ls -khF --group-directories-first --color=auto'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'


alias rs='rsync --recursive --perms --owner --group --human-readable --backup --backup-dir=/tmp/rsync.bak'


