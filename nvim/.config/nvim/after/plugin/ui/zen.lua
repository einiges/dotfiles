PAQ('folke/twilight.nvim') -- dim inactive portions of code
PAQ('folke/zen-mode.nvim') -- hide UI

if not PREQUIRE('zen-mode') then
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

vim.keymap.set('n', '<leader>bf', '<cmd>ZenMode<CR>', {
	desc='Toggle zen mode'
})

