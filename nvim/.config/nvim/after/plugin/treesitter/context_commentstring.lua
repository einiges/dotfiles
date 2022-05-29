-- Change commentstring based of cursor context
require('paq').register('JoosepAlviste/nvim-ts-context-commentstring')

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	context_commentstring = {
		enable = true,
		enable_autocmd = false, -- for Comment.nvim
		-- See also setup in comment.lua
	},
}
