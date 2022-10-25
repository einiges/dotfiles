PAQ('jose-elias-alvarez/null-ls.nvim')
PAQ('nvim-lua/plenary.nvim')

if not PREQUIRE('null-ls') then
	return
end

local formatting = require('null-ls').builtins.formatting

require('null-ls').setup({
	sources = {
		formatting.stylua,
	},
})
