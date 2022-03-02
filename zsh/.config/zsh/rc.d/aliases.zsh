
#   overwriting

alias cp='cp --reflink=auto'
alias ls='ls -khF --group-directories-first --color=auto'
alias find='noglob find'
alias sudo='sudo '


#   globals

alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color=auto'
alias -g W='| wc --lines'
alias -g T='| tee'


#   shorties

alias ,='popd'
alias l="${PAGER:-less}"
alias d='docker'
alias g='noglob git'
alias m='MANPAGER="nvim +Man!" man '
alias n='nvim'
alias nn='sudoedit'
alias ns='notify-send'
alias o='rifle'
alias p='print'
alias pf='print -f'
alias rd='rmdir'
alias t='tmux'
alias ta='tmux attach -t'
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

alias ytdl='youtube-dl'
alias ytdll='youtube-dl --batch-file ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/todo}'
alias ytdla='youtube-dl --download-archive ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/archive}'
alias ytdlla='youtube-dl --batch-file ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/todo} --download-archive ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/archive}'


