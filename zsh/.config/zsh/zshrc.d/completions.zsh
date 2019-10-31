
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' complete-options true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu yes=long select
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' verbose yes

zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:default'      list-prompt '%S%M matches%s'
zstyle ':completion:*:corrections'  format '%K{black}%F{cyan} %d %f%k %K{black}%F{red} %e %f%k'
zstyle ':completion:*:descriptions' format '%K{black}%F{cyan} %d %f%k'
zstyle ':completion:*:messages'     format '%K{black}%F{cyan} %d %f%k'
zstyle ':completion:*:warnings'     format '%K{black}%F{red} no matches found %f%k'
zstyle ':completion:*:matches'      group 'yes'

zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'

zstyle ':completion:*'               completer _complete _match _approximate
zstyle ':completion:*:match:*'       original only
zstyle ':completion:*:approximate:*' max-errors 2 numeric


zstyle ':completion:*:*:cd:*' ignored-patterns '(*/)#lost+found' parent pwd
zstyle ":completion:*:*:$EDITOR:*" ignored-patterns '*.o'


zstyle ':completion:*:*:*:*:processes'    command 'ps -u $USER -o pid,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9a-z-]#)*=34=31'
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:*:kill:*'           force-list always
zstyle ':completion:*:*:kill:*'           insert-ids single

#	"${PREFIX:+=(#bi)($PREFIX:t)(?)(*)===01=34}:${(s.:.)LS_COLORS}"
#zstyle -e ':completion:*:default' list-colors 'reply=(
#	"${PREFIX:+=(#bi)($PREFIX:t)(?)(*)(#B)===01;04}:${(s.:.)LS_COLORS}"
#)'
#zstyle -e ':completion:*:default'      list-colors    'reply=(
#	"${PREFIX:+=(#bi)($PREFIX:t)(?)(*)[[:space:]](―)[[:space:]](*)(#B)===01;04==02=03;02}:${(s.:.)LS_COLORS}"
#	"${PREFIX:+=(#bi)($PREFIX:t)(?)(*)(#B)===01;04}:${(s.:.)LS_COLORS}"
#	"=(#b)[[:space:]]#*(―)[[:space:]]#(*)(#B)==02=03;02"
#)'
