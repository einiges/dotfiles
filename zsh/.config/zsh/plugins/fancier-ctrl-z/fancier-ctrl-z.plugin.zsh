autoload -Uz -- "${0:A:h}/fancier-ctrl-z"

zle -N fancier-ctrl-z
bindkey '^Z' fancier-ctrl-z

