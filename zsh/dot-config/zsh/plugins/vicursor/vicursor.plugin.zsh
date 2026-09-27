# Switch cursor shape, based on current vi mode or when executing a program.

# Should work on all VTE100 compatible Terminals that use the DECSCUSR sequences.

# --------------------------------
# Ps            | Cursor Style
# --------------+-----------------
# 0, 1 or none  | Blink  Block
# 2             | Steady Block
# 3             | Blink  Underline
# 4             | Steady Underline
# 5             | Blink  Pipe
# 6             | Steady Pipe
# --------------------------------

function __vicursor::cursor-on-execute { print -Pn "\e[1 q" }
function __vicursor::cursor-on-command { print -Pn "\e[2 q" }
function __vicursor::cursor-on-insert  { print -Pn "\e[5 q" }
function __vicursor::cursor-on-replace { print -Pn "\e[3 q" }

function __vicursor::keymap-select
{
	case $KEYMAP in
		vicmd )
			__vicursor::cursor-on-command ;;
		main|viins )
			__vicursor::cursor-on-insert ;;
	esac
}

# Mimic mode changes
function __vicursor::replace-widget
{
	zle .vi-replace
	__vicursor::cursor-on-replace
}

function __vicursor::replace-chars-widget
{
	__vicursor::cursor-on-replace
	zle .vi-replace-chars
	__vicursor::cursor-on-command
}

function __vicursor::delete-widget
{
	__vicursor::cursor-on-replace
	zle .vi-delete
	__vicursor::cursor-on-command
}


function __vicursor::stop
{
	autoload -Uz add-zle-hook-widget
	autoload -Uz add-zsh-hook

	add-zle-hook-widget -d keymap-select __vicursor::keymap-select
	add-zsh-hook        -d precmd        __vicursor::cursor-on-insert
	add-zsh-hook        -d preexec       __vicursor::cursor-on-execute
	print -Pn "\e[ q"

	zle -A .vi-delete        vi-delete
	zle -A .vi-replace       vi-replace
	zle -A .vi-replace-chars vi-replace-chars
}

function __vicursor::start
{
	autoload -Uz add-zle-hook-widget
	autoload -Uz add-zsh-hook

	add-zle-hook-widget keymap-select __vicursor::keymap-select
	add-zsh-hook        precmd        __vicursor::cursor-on-insert
	add-zsh-hook        preexec       __vicursor::cursor-on-execute

	zle -N vi-delete        __vicursor::delete-widget
	zle -N vi-replace       __vicursor::replace-widget
	zle -N vi-replace-chars __vicursor::replace-chars-widget
}

__vicursor::start
