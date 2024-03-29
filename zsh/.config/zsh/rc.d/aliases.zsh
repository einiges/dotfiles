
#   overwriting

alias cp='cp --reflink=auto'
alias ls='ls -khF --group-directories-first --color=auto'
alias find='noglob find'
alias sudo='sudo '
alias man='man '


#   globals

alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color=auto'
alias -g S='| sort'
alias -g T='| tee'
alias -g U='| uniq'
alias -g W='| wc --lines'
alias -g X='| xargs'
alias -g Y='| fzy'


#   shorties

alias ,='popd'
alias l="${PAGER:-less}"
alias d='docker'
alias g='noglob git'
alias nn='sudoedit'
alias ns='notify-send'
alias p='print'
alias pf='print -f'
alias rd='rmdir'
alias s='sudo'
aliases[==]='noglob units'


#   brain support

alias mpvao='mpv --no-video'

alias taghere='touch .tags'


#   quickies

alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias lan='ls -ld . ..'

alias rs='rsync -ahu'

alias TS='print -P -f "%s" "%D{%Y%m%d%H%M%S}"'
alias TSH='print -P -f "%s" "%D{%Y-%m-%d %H:%M:%S}"'

#   custom functions
aliases[=]='noglob -zcalc'
alias .,='-push-or-pop-oldpwd'


