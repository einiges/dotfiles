PAQ('lewis6991/gitsigns.nvim')
PAQ('nvim-lua/plenary.nvim')

if not PREQUIRE('gitsigns') then
	return
end

require('gitsigns').setup({
	numhl = false,
	current_line_blame = true,
})
