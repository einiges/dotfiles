#!/bin/zsh


setopt always_to_end
setopt auto_list
setopt complete_aliases
setopt complete_in_word
setopt extended_glob
unsetopt list_ambiguous

setopt glob_star_short



#zstyle ':completion:*' list-prompt ''
#zstyle ':completion:*' select-prompt ''
#zstyle ':completion:*' group-name ''

zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}



zstyle ':completion:*:default'      list-prompt '%S%M matches%s'
zstyle ':completion:*:corrections'  format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:matches'      group 'yes'
zstyle ':completion:*:messages'     format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings'     format ' %F{red}-- no matches found --%f'

zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'

zstyle ':completion::complete:*' use-cache on


zstyle ':completion:*'               completer _complete _match _approximate
zstyle ':completion:*:match:*'       original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric



# -- kill --

zstyle ':completion:*:*:*:*:processes'    command 'ps -u $USER -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=34=31=33'
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:*:kill:*'           force-list always
zstyle ':completion:*:*:kill:*'           insert-ids single


