#!/bin/zsh

alias -g L='| less -r'
alias -g G='| grep --color'
alias -g W='| wc'

alias ,='popd'
alias .,='cd ~-'

# -- shorties --

alias c='cat'
alias e='echo'
alias n='nvim'
alias o='xdg-open'
alias g='git'
alias t='tmux'
alias ta='tmux attach -t'

alias  ls='ls -khF --group-directories-first --color=auto'
alias   l='ls'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'

alias  du='du --human-readable'
alias dus='du -s'
alias cpr='cp -r'

alias nmutt='neomutt'

alias feh='feh -.'
alias scanlnet='nmap -sP 192.168.2.1/24'

alias rs='rsync --recursive --perms --owner --group --human-readable --backup --backup-dir=/tmp/rsync.bak'

alias yl='youtube-dl --output "%(title)s.%(ext)s" --ignore-errors'
alias ylUrl2mp3='yl --extract-audio --audio-format mp3 --audio-quality 0'
alias ylList2mp3='ylUrl2mp3 -a'

alias yv='youtube-viewer --player=mpv'

alias getWindowInfo='xprop | grep "WM_CLASS\|WM_NAME\|WM_WINDOW_ROLE\|_NET_WM_WINDOW_TYPE"'

