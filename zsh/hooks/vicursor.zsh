#!/usr/bin/env zsh

# Switch cursor shape, based on current vi mode or when executing a program.

# Should work on all VTE100 compatible Terminals that use the DECSCUSR sequences.
#
# tmux: tested with 2.7
# may require following line in tmux.conf:
#    set -ag terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
#
# screen: (tested with 4.06.02)
# requires following line in screenrc!:
#    requires "setenv VICURSOR_TERM $TERM"

vicursor::cursor_on_execute()
{
	printf '%b' $vicursor_execute_cursor
}

vicursor::cursor_on_command()
{
	printf '%b' $vicursor_command_cursor
}

vicursor::cursor_on_insert()
{
	printf '%b' $vicursor_insert_cursor
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

	typeset -g sequencetype

	if [[ "$baseterm" =~ "Konsole" || -v KONSOLE_DBUS_SESSION ]]
	then
		return 1
	elif [[ "$baseterm" =~ "st.*"
	   || "$baseterm" =~ 'rxvt-unicode.*'
	   || "$baseterm" =~ 'xterm.*'
	   || ${TERM_PROGRAM:-$baseterm} =~ 'iTerm.*' || -v ITERM_SESSION_ID
	   || $VTE_VERSION -ge 3900
	   || ${XTERM_VERSION//[^0-9]/} -ge 252
	   ]]
	then
	else
		return 1
	fi

	vicursor::sequence_to_var "vicursor_insert_cursor"  5
	vicursor::sequence_to_var "vicursor_command_cursor" 1
	vicursor::sequence_to_var "vicursor_execute_cursor" 2

	unset sequencetype
}

vicursor::sequence_to_var() {
	local varname=$1
	local cursorshape=$2
	local sequence

	sequence="\e[${cursorshape} q"


	# Screen or tmux
	if [[ -v STY || -v TMUX ]]; then
		sequence="\eP${sequence}\e\\"
	fi

	typeset -g $varname=$sequence
}

vicursor::stop()
{
	add-zle-hook-widget -d keymap-select vicursor::keymap
	add-zsh-hook        -d precmd        vicursor::cursor_on_insert
	add-zsh-hook        -d preexec       vicursor::cursor_on_execute
	vicursor::cursor_on_execute
}

vicursor::start()
{
	add-zle-hook-widget keymap-select vicursor::keymap
	add-zsh-hook        precmd        vicursor::cursor_on_insert
	add-zsh-hook        preexec       vicursor::cursor_on_execute
}

autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

vicursor::setup
(( $? )) &&
	return 1

vicursor::start


