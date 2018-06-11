#!/bin/zsh

alias -g L='| less -r'
alias -g G='| grep --color'
alias -g W='| wc'

alias ,='popd'
alias .,='oldpwd'

# -- shorties --

alias l=${PAGER:-less}
alias n='nvim'
alias o='xdg-open'
alias p=print
alias g='git'
alias t='tmux'
alias ta='tmux attach -t'

alias  ls='ls -khF --group-directories-first --color=auto'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'

alias nmutt='neomutt'

alias rs='rsync --recursive --perms --owner --group --human-readable --backup --backup-dir=/tmp/rsync.bak'


