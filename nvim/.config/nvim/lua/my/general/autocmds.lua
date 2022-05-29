
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanked text for a short amount of time',
	group = vim.api.nvim_create_augroup('YankHighlight', {}),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch' }
	end,
})

vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('NvimTerminal', {}),
	desc = 'Start Terminal in insert',
	pattern = '*',
	command = 'startinsert',
})

