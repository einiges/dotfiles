#!/bin/zsh


setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
#setopt GLOB_COMPLETE
setopt AUTO_LIST
unsetopt LIST_AMBIGUOUS
#setopt MENU_COMPLETE


#ZLE_REMOVE_SUFFIX_CHARS=$' '
ZLE_SPACE_SUFFIX_CHARS=$'&|'



#zstyle ':completion:*' list-prompt ''
#zstyle ':completion:*' select-prompt ''
#zstyle ':completion:*'group-name ''

zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'
zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==01;31=}:${(s.:.)LS_COLORS}")

zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*' menu select
zstyle ':completion:*:*:(nvim|vim):*:*files' ignored-patterns '(*.class|*.o|*.hi)'

zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
