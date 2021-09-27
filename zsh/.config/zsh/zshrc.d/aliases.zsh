alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color'
alias -g W='| wc'
alias -g ∃='2> /dev/null'
alias -g ∀='> /dev/null 2>&1'
alias -g Σ="' '"
alias -g CL=' && clear'

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
alias nn='sudoedit'
alias o='rifle'
alias p='print'
alias g='noglob git'
alias t='tmux'
alias ta='tmux attach -t'
alias sc='systemctl'
alias '~'='noglob units'

alias  ls='ls -khF --group-directories-first --color=auto'
alias  sl='ls'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'

alias rd='rmdir'

alias sudo='sudo '

alias find='noglob find'

alias nan="MANPAGER=\"nvim -n '+set ft=man' -\" man"

alias taghere='touch .tags'

alias rs='rsync -ahu'
alias mpvao='mpv --no-video'
alias paur=paru
alias ncmpcpp='ncmpcpp --quiet'

alias ytdl='youtube-dl'
alias ytdll='youtube-dl --batch-file ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/todo}'
alias ytdla='youtube-dl --download-archive ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/archive}'
alias ytdlla='youtube-dl --batch-file ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/todo} --download-archive ${YOUTUBE_DL_BATCH_FILE:-${XDG_DATA_HOME:-$HOME/.local/share}/youtube-dl/archive}'


