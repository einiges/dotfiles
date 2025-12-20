
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanked text for a short amount of time',
	group = vim.api.nvim_create_augroup('MyYankHighlight', {}),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			on_visual = false,
		})
	end,
})

local myTerminalGroup = vim.api.nvim_create_augroup('MyNvimTerminal', {})
vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'Start terminal in insert',
	group = myTerminalGroup,
	command = 'startinsert',
})

vim.api.nvim_create_autocmd('BufEnter', {
	desc = 'Enter terminal in insert',
	group = myTerminalGroup,
	pattern = 'term://*',
	command = 'startinsert',
})

vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Jump to last place, we have visited before exiting',
	group = vim.api.nvim_create_augroup('MyJumpToLastPlace', {}),
	pattern = '*',
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if 0 < mark[1] and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
