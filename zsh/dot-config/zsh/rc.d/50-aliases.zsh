
# globals

alias -g P='| ${PAGER:-less}'
alias -g F='| grep --color=auto'
alias -g LN='| wc --lines'
alias -g X='| xargs'
alias -g Z='| zargs'

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
alias lt='ll -t'
alias lh='l --directory -- .*(N)'
alias lhh='l -l --directory -- . .. .*(N)'
alias lf='l -- *(.N)'
alias llf='ll -- *(.N)'
alias llff='ll -- *(.N) .*(.N)'
alias ld='l --directory -- *(/N)'
alias lld='ll --directory -- *(/N)'
alias lldd='ll --directory -- *(/N) .*(/N)'

# development
alias e='editor --'
alias g='noglob git'

alias k='kubectl'
alias c=podman
alias cc='podman compose'
alias ccl='podman compose logs --tail 500 --follow'
alias ccll='podman compose logs'
alias cclll='podman compose logs --follow'
alias ccu='podman compose up'
alias ccuu='podman compose up --detach'
alias ccd='podman compose down'
alias ccdd='podman compose down --volumes'
alias cca='podman compose start'
alias cco='podman compose stop'
alias ccx='podman compose exec'

alias taghere='touch .tags'


# system administration
alias R='run0 '
alias E='sudoedit --'

alias Pkg='pacman'
alias Pkgu='pacman -Syu'
alias Pkgrm='pacman -Rs'
alias Pkgrmm='pacman -Rsn'
alias Pkgg='pacman -Ss'
alias Pkgi='pacman -Si'
alias Pkgii='pacman -Sii'
alias PkgRequires='pactree --unique'
alias PkgRequiredBy='pactree --reverse'

# shell
alias p='print --'
alias pf='printf'
alias pn='printf -- "%s\n"'
alias p0='printf -- "%s\0"'

# external
alias m='man'
alias o='xdg-open'

aliases[=]='noglob -zcalc'
aliases[==]='noglob units --history ""'

alias ns='notify-send'

