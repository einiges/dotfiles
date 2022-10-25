PAQ('nvim-neorg/neorg')
PAQ('nvim-lua/plenary.nvim')

if not PREQUIRE('neorg') then
	return
end

require('neorg').setup({
	load = {
		['core.defaults'] = {},
		['core.norg.concealer'] = {},
	},
})

