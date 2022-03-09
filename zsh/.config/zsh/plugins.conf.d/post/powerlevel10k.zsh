# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


function {


setopt local_options noaliases noshglob braceexpand
emulate -L zsh -o extended_glob



# Unset all configuration options. This allows you to apply configuration changes without
# restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

# Zsh >= 5.1 is required.
autoload -Uz is-at-least && is-at-least 5.1 || return




typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	#   Line #1
	dir                     # current directory
	vcs                     # git status
	#   Line #2
	newline                 # \n
	prompt_char             # prompt symbol
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	#   Line #1
	status
	command_execution_time

	context
	background_jobs

	#   Line #2
	newline
)

typeset -g POWERLEVEL9K_ICON_PADDING=none
typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=

typeset -g POWERLEVEL9K_BACKGROUND=
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=' '
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR='%K{8} %k'
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR='|'

typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=




#
#
#   prompt_char: prompt symbol
#
#

# Transparent background.
typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=14
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=9
# Default prompt symbol.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='◆'
# Prompt symbol in command vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='◆'
# Prompt symbol in visual vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='◆'
# Prompt symbol in overwrite vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='◆'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
# No line terminator if prompt_char is the last segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
# No line introducer if prompt_char is the first segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=' '




#
#
#   dir: current directory
#
#

typeset -g POWERLEVEL9K_DIR_BACKGROUND=0
typeset -g POWERLEVEL9K_DIR_FOREGROUND=14
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=14
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=4
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
local anchor_files=()

typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false

typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=
typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=
typeset -g POWERLEVEL9K_DIR_CLASSES=()




#
#
#   vcs: git status
#
#
#

typeset -g POWERLEVEL9K_VCS_{CLEAN,CONFLICT,MODIFIED,UNTRACKED}_BACKGROUND=0
typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=0

typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '

# Formatter for Git status.
function my_git_formatter() {
	emulate -L zsh

	if [[ -n $P9K_CONTENT ]]; then
		typeset -g my_git_format=$P9K_CONTENT
		return
	fi

	# Styling for different parts of Git status.
	local    branchc='%14F%B'
	local       meta='%14F'
	local      clean='%14F%b%u'
	local   modified='%6F'
	local  untracked='%3F'
	local conflicted='%1F'

	local res

	if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
		local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
		# Trim branchname
		(( $#branch > 32 )) && branch[32,-1]="…"
		res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branchc}${branch//\%/%%}${clean}"
	fi

	if [[ -n $VCS_STATUS_TAG ]]; then
		local tag=${(V)VCS_STATUS_TAG}
		res+="${meta}#${clean}${tag//\%/%%}"
	fi

	# Display the current Git commit if there is no branch and no tag.
	[[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&
		res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

	# Show tracking branch name if it differs from local branch.
	if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
		res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
	fi

	# Display "wip" if the latest commit's summary contains "wip" or "WIP".
	if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
		res+=" ${modified}wip"
	fi

	(( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
	(( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
	(( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"

	(( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
	(( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
	(( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"

	(( VCS_STATUS_STASHES        )) && res+=" ${clean}=${VCS_STATUS_STASHES}"
	[[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
	(( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}%Bχ%b${VCS_STATUS_NUM_CONFLICTED}"
	(( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}%Bτ%b${VCS_STATUS_NUM_STAGED}"
	(( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}%Bυ%b${VCS_STATUS_NUM_UNSTAGED}"

	(( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}%Bη%b${VCS_STATUS_NUM_UNTRACKED}"

	(( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}-"

	typeset -g my_git_format=$res
}

functions -M my_git_formatter 2>/dev/null

typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)




#
#
#   status: exit code of the last command
#
#

typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

typeset -g POWERLEVEL9K_STATUS_OK=false

typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='err'
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=9
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0

typeset -g POWERLEVEL9K_STATUS_ERROR=false

typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=1
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=0

typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='err'
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=1
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=0




#
#
#   command_execution_time: duration of the last command
#
#

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=0
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=




#
#
#   background_jobs: presence of background jobs
#
#

typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=9
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='J'




#
#
#   context: user@hostname
#
#

# Context color when running with privileges.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=9
typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=7
# Context color in SSH without privileges.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=4
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0
# Default context color (no privileges, no SSH).
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=14
typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0

# Context format when running with privileges: user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n%b'
# Context format when in SSH without privileges: user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
# Default context format (no privileges, no SSH): user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# Don't show context unless running with privileges or in SSH.
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=




#
#
#   time: current time
#
#

# Current time color.
typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
typeset -g POWERLEVEL9K_TIME_BACKGROUND=7
# Format for the current time: 09:51:02. See `man 3 strftime`.
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
# If set to true, time will update when you hit enter. This way prompts for the past
# commands will contain the start times of their commands as opposed to the default
# behavior where they contain the end times of their preceding commands.
typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
# Custom icon.
typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=
# Custom prefix.
# typeset -g POWERLEVEL9K_TIME_PREFIX='at '




#
#
#   End
#
#

typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
(( ! $+functions[p10k] )) || p10k reload


#   end anonymous function
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

