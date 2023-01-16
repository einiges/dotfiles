-- Show Keybindings with description
PAQ('folke/which-key.nvim')

if not PREQUIRE('which-key') then
	return
end

require('which-key').setup({
	key_labels = {
		['<space>'] = '␣',
		['<cr>'] = '⏎',
		['<tab>'] = '↹',
	},
	icons = {
		breadcrumb = '→',
		separator = '→',
	},
	window = {
		border = 'single',
	},
})

