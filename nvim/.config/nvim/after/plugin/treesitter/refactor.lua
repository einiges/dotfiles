PAQ('nvim-treesitter/nvim-treesitter-refactor')

if not PREQUIRE('nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup({
	refactor = {
		highlight_definitions = {
			enable = false,
		},
		highlight_current_scope = {
			enable = false,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = 'grr',
			},
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = 'gnd',
				list_definitions = 'gnd',
			},
		},
	},
})
