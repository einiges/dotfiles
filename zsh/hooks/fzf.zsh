# Setup fzf
# ---------
if [[ ! "$PATH" == *$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/bin* ]]; then
  export PATH="$PATH:$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/man* && -d "$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/man" ]]; then
  export MANPATH="$MANPATH:$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_CACHE_HOME/zsh/zplug/repos/junegunn/fzf/shell/key-bindings.zsh"

