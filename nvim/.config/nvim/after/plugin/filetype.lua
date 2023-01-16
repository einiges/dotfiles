
vim.filetype.add({
	pattern = {
		['.*/git/.+%.gitconfig'] = 'gitconfig',
		['.*/tmux/.+%.conf'] = 'tmux',
	},
})
