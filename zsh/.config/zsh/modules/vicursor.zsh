# Switch cursor shape, based on current vi mode or when executing a program.

# Should work on all VTE100 compatible Terminals that use the DECSCUSR sequences.
#
# tmux: tested with 2.7
# may require following line in tmux.conf:
#    set -ag terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
#
# screen: (tested with 4.06.02)
# requires following line in screenrc!:
#    setenv VICURSOR_TERM $TERM

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

function __vicursor::cursor_on_execute
{
	print -n $__vicursor__execute_cursor
}

function __vicursor::cursor_on_command
{
	print -n $__vicursor__command_cursor
}

function __vicursor::cursor_on_insert
{
	print -n $__vicursor__insert_cursor
}

function __vicursor::cursor_on_replace
{
	print -n $__vicursor__replace_cursor
}

function __vicursor::keymap
{
	case $KEYMAP in
		vicmd )
			__vicursor::cursor_on_command ;;
		main|viins )
			__vicursor::cursor_on_insert ;;
	esac
}


function __vicursor::setup
{
	local baseterm=${VICURSOR_TERM:-$TERM}

	if [[ ! -v VICURSOR_TERM && -v TMUX ]]; then
		# $(tmux show-environment ...) is relatively slow...
		baseterm=${$(tmux show-environment -g TERM)#*=}
	fi

	if [[ "$baseterm" =~ "Konsole" || -v KONSOLE_DBUS_SESSION ]]
	then
		return 1
	elif
	  [[ "${TERM_PROGRAM:-$baseterm}" =~ "(st|rxvt-unicode|xterm|iTerm).*"
	  || -v ITERM_SESSION_ID
	  || $VTE_VERSION -ge 3900
	  || ${XTERM_VERSION//[^0-9]/} -ge 252
	  ]]
	then
	else
		return 1
	fi

	__vicursor::sequence_to_var 5 "__vicursor__insert_cursor"
	__vicursor::sequence_to_var 2 "__vicursor__command_cursor"
	__vicursor::sequence_to_var 1 "__vicursor__execute_cursor"
	__vicursor::sequence_to_var 4 "__vicursor__replace_cursor"
}

function __vicursor::sequence_to_var
{
	local cursorshape=$1
	local varname=$2
	local sequence

	sequence="\e[${cursorshape} q"


	# Screen or tmux
	if [[ -v STY || -v TMUX ]]; then
		sequence="\eP${sequence}\e\\"
	fi

	typeset -g $varname=$sequence
}

# Mimic mode changes
function __vicursor::replace_widget
{
	zle .vi-replace
	__vicursor::cursor_on_replace
}

function __vicursor::replace_chars_widget
{
	__vicursor::cursor_on_replace
	zle .vi-replace-chars
	__vicursor::cursor_on_command
}

function __vicursor::delete_widget
{
	__vicursor::cursor_on_replace
	zle .vi-delete
	__vicursor::cursor_on_command
}

function __vicursor::yank_widget
{
	__vicursor::cursor_on_replace
	zle .vi-yank
	__vicursor::cursor_on_command
}




function __vicursor::stop
{
	add-zle-hook-widget -d keymap-select __vicursor::keymap
	add-zsh-hook        -d precmd        __vicursor::cursor_on_insert
	add-zsh-hook        -d preexec       __vicursor::cursor_on_execute
	__vicursor::cursor_on_execute

	zle -A .vi-delete vi-delete
	zle -A .vi-replace vi-replace
	zle -A .vi-replace-chars vi-replace-chars
	#zle -A .vi-yank vi-yank
}

function __vicursor::start
{
	add-zle-hook-widget keymap-select __vicursor::keymap
	add-zsh-hook        precmd        __vicursor::cursor_on_insert
	add-zsh-hook        preexec       __vicursor::cursor_on_execute

	zle -N vi-delete __vicursor::delete_widget
	zle -N vi-replace __vicursor::replace_widget
	zle -N vi-replace-chars __vicursor::replace_chars_widget
	#zle -N vi-yank __vicursor::yank_widget
}

__vicursor::setup || return 0

autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

__vicursor::start
