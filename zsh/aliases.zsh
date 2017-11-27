#!/bin/zsh

alias -g L='| less -r'
alias -g G='| grep --color'
alias -g W='| wc'

alias -s java=$EDITOR
alias -s    c=$EDITOR
alias -s    h=$EDITOR
alias -s  cpp=$EDITOR
alias -s  hpp=$EDITOR
alias -s   hs=$EDITOR

alias -s haml=$EDITOR
alias -s  css=$EDITOR
alias -s scss=$EDITOR
alias -s  xml=$EDITOR
alias -s  yml=$EDITOR
alias -s   js=$EDITOR
alias -s  php=$EDITOR

alias -s  txt=$EDITOR
alias -s  tex=$EDITOR

alias -s  html=$BROWSER
alias -s xhtml=$BROWSER
alias -s   pdf='zathura'

alias   ...='cd ../..'
alias  ....='cd ../../..'
alias .....='cd ../../../..'
alias ,='popd'
alias .,='cd ~-'
alias ,,='cd $_'

alias e='echo'
alias n='nvim'
alias o="xdg-open"

alias  ls="ls -khF --group-directories-first --color=auto "
alias   l='ls'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'


alias  du='du --human-readable'
alias dus='du -s'
alias cpr="cp -r"

alias feh='feh -.'
alias scanlnet='nmap -sP 192.168.2.1/24'

alias rsync='rsync --human-readable'
alias snc='rsync --progress'
alias snc2='rsync --info=progress2'

alias yl='youtube-dl --output "%(title)s.%(ext)s" --ignore-errors'
alias ylUrl2mp3='yl --extract-audio --audio-format mp3 --audio-quality 0'
alias ylList2mp3='ylUrl2mp3 -a'

alias yv='youtube-viewer --player=mplayer'

alias t=tmux


alias getWindowInfo="xprop | grep 'WM_CLASS\|WM_NAME\|WM_WINDOW_ROLE\|_NET_WM_WINDOW_TYPE'"

#alias sudo='nocorrect sudo'


