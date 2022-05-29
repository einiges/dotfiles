require('paq').register('nvim-neorg/neorg')
require('paq').register('nvim-lua/plenary.nvim')

if not pcall(require, 'neorg') then
	return
end

require('neorg').setup({
	load = {
		['core.defaults'] = {},
		['core.norg.concealer'] = {},
	},
})

