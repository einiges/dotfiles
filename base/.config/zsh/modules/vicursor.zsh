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

vicursor::cursor_on_execute()
{
	print -n $vicursor_execute_cursor
}

vicursor::cursor_on_command()
{
	print -n $vicursor_command_cursor
}

vicursor::cursor_on_insert()
{
	print -n $vicursor_insert_cursor
}

vicursor::cursor_on_replace()
{
	print -n $vicursor_replace_cursor
}

vicursor::keymap()
{
	case $KEYMAP in
		vicmd )
			vicursor::cursor_on_command ;;
		main|viins )
			vicursor::cursor_on_insert ;;
	esac
}


vicursor::setup()
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

	vicursor::sequence_to_var 5 "vicursor_insert_cursor"
	vicursor::sequence_to_var 2 "vicursor_command_cursor"
	vicursor::sequence_to_var 1 "vicursor_execute_cursor"
	vicursor::sequence_to_var 4 "vicursor_replace_cursor"
}

vicursor::sequence_to_var()
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

# Because replace mode is not treated in $KEYMAP
vicursor::replace_widget()
{
	zle .vi-replace
	vicursor::cursor_on_replace
}

vicursor::replace_chars_widget()
{
	vicursor::cursor_on_replace
	zle .vi-replace-chars
	vicursor::cursor_on_command
}


vicursor::stop()
{
	add-zle-hook-widget -d keymap-select vicursor::keymap
	add-zsh-hook        -d precmd        vicursor::cursor_on_insert
	add-zsh-hook        -d preexec       vicursor::cursor_on_execute
	vicursor::cursor_on_execute

	zle -A .vi-replace vi-replace
	zle -A .vi-replace-chars vi-replace-chars
}

vicursor::start()
{
	add-zle-hook-widget keymap-select vicursor::keymap
	add-zsh-hook        precmd        vicursor::cursor_on_insert
	add-zsh-hook        preexec       vicursor::cursor_on_execute

	zle -N vi-replace vicursor::replace_widget
	zle -N vi-replace-chars vicursor::replace_chars_widget
}

vicursor::setup || return 0

autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

vicursor::start
