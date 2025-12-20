typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
typeset -g ZSH_AUTOSUGGEST_USE_ASYNC=1
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=10

bindkey '^f' autosuggest-accept
bindkey '^t' autosuggest-execute
