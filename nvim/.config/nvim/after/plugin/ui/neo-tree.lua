PAQ('nvim-neo-tree/neo-tree.nvim')
PAQ('kyazdani42/nvim-web-devicons')
PAQ('nvim-lua/plenary.nvim')
PAQ('MunifTanjim/nui.nvim')

if not PREQUIRE('neo-tree') then
	return
end

require('neo-tree').setup({
	enable_git_status = false,
	source_selector = {
		winbar = false,
	},
})


vim.keymap.set('n', '<leader>ee', '<CMD>NeoTreeFocusToggle<CR>',
	{ desc = 'Toggle file explorer' })

