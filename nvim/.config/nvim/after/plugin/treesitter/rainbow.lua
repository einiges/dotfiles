PAQ('p00f/nvim-ts-rainbow')

if not PREQUIRE('nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup({
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 2500,
	},
})
