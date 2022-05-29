require('paq').register('p00f/nvim-ts-rainbow')

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 2500,
	},
}

