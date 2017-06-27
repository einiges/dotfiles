PROMPT='%{$fg[blue]%}%~%{$reset_color%} $(git_super_status)%{$fg_bold[red]%}▶ %{$reset_color%}'

if [ -n "$SSH_CONNECTION" ]; then
	local ppUser="%{$fg_bold[blue]%}%n%{$reset_color%}"
	local ppHost="%{$fg_bold[red]%}%m%{$reset_color%}"
	RPROMPT="${ppUser} @ ${ppHost}"
fi

