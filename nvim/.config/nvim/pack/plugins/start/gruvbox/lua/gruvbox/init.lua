
local M = {}

local set_theme = function(tbl)
	for group, def in pairs(tbl) do
		vim.api.nvim_set_hl(0, group, def)
	end
end

local set_theme_async = function(tbl)
	local async_load
	async_load = vim.loop.new_async(vim.schedule_wrap(function()
		set_theme(tbl)
		async_load:close()
	end))
	async_load:send()
end

M.setup = function()

	vim.cmd.highlight('clear')

	if vim.fn.exists('syntax_on') then
		vim.api.nvim_command('syntax reset')
	end

	vim.g.colors_name = 'gruvbox'

	local theme = require('gruvbox.theme').get()
	set_theme(theme.editor)
	set_theme(theme.plugin)
end

return M

