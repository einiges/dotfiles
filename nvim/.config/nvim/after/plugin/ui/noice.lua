PAQ('folke/noice.nvim')
PAQ('MunifTanjim/nui.nvim')
-- WATCH: https://github.com/neovim/neovim/issues/1496
PAQ('rcarriga/nvim-notify')

if not PREQUIRE('noice') then
	return
end

require('noice').setup({
	messages = {
		enabled = false,
	},
	lsp = {
		signature = {
			enabled = false,
		},
		hover = {
			enabled = false,
		},
	},
})
