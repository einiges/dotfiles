require('paq').register('nvim-treesitter/nvim-treesitter-refactor')

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	refactor = {
		highlight_definitions = {
			enable = true,
		},
		highlight_current_scope = {
			enable = false,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
			},
		 },
	},
}

