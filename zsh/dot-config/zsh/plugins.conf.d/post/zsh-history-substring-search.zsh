typeset -g HISTORY_SUBSTRING_SEARCH_FUZZY=1
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=fg=white,bold,underline
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=bg=red,fg=black,bold

bindkey '^n' history-substring-search-up
bindkey '^r' history-substring-search-down
