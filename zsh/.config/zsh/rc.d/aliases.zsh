
# globals

alias -g 'P'='| ${PAGER:-less}'
alias -g 'G'='| grep --color=auto'
alias -g 'W'='| wc --lines'
alias -g 'X'='| xargs'


# navigation
alias ,='popd'
alias .,='-push-or-pop-oldpwd'

alias md='mkdir'
alias mdd='mkdir -p'
alias cdd='-mkdir-and-cd'
alias mv='mv -i'
alias mvv='\mv'
alias cp='cp -i'
alias cpp='\cp -ir'
alias cppp='\cp -r'
alias rd='rmdir'
alias rdd='rmdir -p'
alias rmm='rm -r'
alias rmmm='rm -rf'
alias rs='rsync -ahu'

alias f='noglob find'

alias l='\ls --kibibytes --human-readable --classify --group-directories-first --color=auto'
alias ll='l -l'
alias lll='ll -A'
alias llll='lll -a'
alias l.='l -ld . ..'


# development
alias e='editor --'
alias g='noglob git'

alias k='kubectl'
alias d='docker'
alias dc='docker compose'
alias dcl='docker compose logs --tail 500'
alias dcll='docker compose logs --tail 500 --follow'
alias dclll='docker compose logs'
alias dcllll='docker compose logs --follow'
alias dcu='docker compose up'
alias dcuu='docker compose up --detach'
alias dcd='docker compose down'
alias dcdd='docker compose down --volumes'
alias dca='docker compose start'
alias dco='docker compose stop'
alias dcx='docker compose exec'

alias taghere='touch .tags'


# system administration
alias P='pacman'
alias Pu='pacman -Syu'
alias Pr='pacman -Rs'
alias Prr='pacman -Rsn'
alias Ps='pacman -Ss'
alias Pi='pacman -Si'
alias Pii='pacman -Sii'
alias R='sudo '
alias E='sudoedit --'

# shell
alias p='print --'
alias pf='printf'
alias pn='printf "%s\n"'
alias p0='printf "%s\0"'

# external
alias m='man'
alias o='xdg-open'

aliases[=]='noglob -zcalc'
aliases[==]='noglob units --history "" --log ""'

alias ns='notify-send'

