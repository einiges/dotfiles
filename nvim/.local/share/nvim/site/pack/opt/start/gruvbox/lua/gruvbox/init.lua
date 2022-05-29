
local M = {}

M.set = function()
	vim.api.nvim_command('highlight clear')

	if vim.fn.exists('syntax_on') then
		vim.api.nvim_command('syntax reset')
	end

	vim.g.colors_name = 'gruvbox'

	local theme = require('gruvbox.theme')
	local colors = require('gruvbox.colors')

	for group, def in pairs(theme(colors.palette())) do
		vim.api.nvim_set_hl(0, group, def)
	end
end

return M

