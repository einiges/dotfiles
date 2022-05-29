require('paq').register('folke/twilight.nvim') -- dim inactive portions of code
require('paq').register('folke/zen-mode.nvim') -- hide UI

if not pcall(require, 'zen-mode') then
	return
end

require('zen-mode').setup {
	window = {
		options = {
			number = false,
			relativenumber = false,
		}
	},

	plugins = {
		gitsigns = { enabled = true },
	},
}

vim.keymap.set('n', '<leader>if', '<cmd>ZenMode<CR>', {
	desc='Toggle zen mode'
})

