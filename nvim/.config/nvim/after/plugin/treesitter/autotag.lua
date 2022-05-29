-- Automatically close <tags>
require('paq').register('windwp/nvim-ts-autotag')

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	autotag = {
		enable = true,
		filetypes = {
			'html',
			'xhtml',
			'xml',
		},
	},
}


