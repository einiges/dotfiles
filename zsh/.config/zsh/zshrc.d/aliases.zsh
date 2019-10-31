alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color'
alias -g W='| wc'
alias -g ∃='2> /dev/null'
alias -g ∀='> /dev/null 2>&1'
alias -g Σ="' '"

alias -g TODAY='${(%):-"%D{%Y%m%d}"}'
alias -g TODAYH='${(%):-"%D{%Y-%m-%d}"}'
alias -g NOW='${(%):-"%D{%H%M%S}"}'
alias -g NOWH='${(%):-"%D{%H:%M:%S}"}'
alias -g TIMESTAMP='${(%):-"%D{%Y%m%d%H%M%S}"}'
alias -g TIMESTAMPH='${(%):-"%D{%Y-%m-%d %H:%M:%S}"}'

alias -g ::='$_'
alias -g :::='$_:h'

alias ,='popd'

# -- shorties --

alias d='docker'
alias l=${PAGER:-less}
alias m='man'
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

alias rd='rmdir'

alias find='noglob find'
alias ff='find . -type f -iname'
alias fd='find . -type d -iname'
alias fl='find . -type l -iname'

alias nan="MANPAGER=\"nvim -n '+set ft=man' -\" man"

alias taghere='touch .tags'

alias rs='rsync --recursive --perms --owner --group --human-readable'

