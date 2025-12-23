
	
function zplugin-clone-all {
	local plugins=(
		'https://github.com/romkatv/zsh-defer'
		'https://github.com/Aloxaf/fzf-tab'

		'https://github.com/zsh-users/zsh-autosuggestions'
		'https://github.com/zdharma-continuum/fast-syntax-highlighting'

		'https://github.com/zsh-users/zsh-history-substring-search'
		'https://github.com/zsh-users/zsh-completions'
		'https://github.com/agkozak/zsh-z'
	)

	zplugin-clone2 "${(@)plugins}"
}


# source plugin pre config
function {
local src
for src in "$ZDOTDIR"/plugins.conf.d/pre/*.zsh(.,@N); do
	load "$src"
done
}

zplugin-load || zplugin-generate && zplugin-load

# source plugins post config
function {
local src
for src in "$ZDOTDIR"/plugins.conf.d/post/*.zsh(.,@N); do
	load "$src"
done
}

