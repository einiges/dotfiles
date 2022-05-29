require('paq').register('nvim-lualine/lualine.nvim')
require('paq').register('kyazdani42/nvim-web-devicons')

local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

lualine.setup {
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
}

