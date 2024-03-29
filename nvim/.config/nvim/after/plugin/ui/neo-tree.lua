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
	filesystem = {
		group_empty_dirs = true,
		follow_current_file = true,
	},
})


vim.keymap.set('n', '<leader>e', '<CMD>NeoTreeFocusToggle<CR>',
	{ desc = 'Toggle file explorer' })

