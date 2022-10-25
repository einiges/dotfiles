PAQ('nvim-lualine/lualine.nvim')
PAQ('kyazdani42/nvim-web-devicons')

if not PREQUIRE('lualine') then
	return
end

local settings = {
	options = {
		component_separators = {
			left = '│',
			right = '│',
		},
		section_separators   = {
			left = '',
			right = '',
		},
	},

	winbar = {
		lualine_a = { 'vim.fn.winnr()' },
		lualine_b = { 'filename' },
		lualine_c = { 'empty' },
		lualine_x = { 'diagnostics' },
		lualine_y = { },
		lualine_z = { },
	},
	inactive_winbar = {
		lualine_a = { 'vim.fn.winnr()' },
		lualine_b = { 'filename' },
		lualine_c = { 'empty' },
		lualine_x = { 'diagnostics' },
		lualine_y = { },
		lualine_z = { },
	},
}

local empty = function()
	return ''
end

if pcall(require, 'nvim-navic') then
	local navic = require('nvim-navic')
	settings.winbar.lualine_c = { { navic.get_location, cond = navic.is_available } }
end

require('lualine').setup(settings)
