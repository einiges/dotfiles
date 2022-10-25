-- Automatically close <tags>
PAQ('windwp/nvim-ts-autotag')


if not PREQUIRE('nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup({
	autotag = {
		enable = true,
		filetypes = {
			'html',
			'xhtml',
			'xml',
		},
	},
})
