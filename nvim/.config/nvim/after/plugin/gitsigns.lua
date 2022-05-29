require('paq').register('lewis6991/gitsigns.nvim')
require('paq').register('nvim-lua/plenary.nvim')

local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
	return
end

gitsigns.setup {
	numhl = false,
	current_line_blame = true,
}
