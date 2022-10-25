PAQ('nvim-telescope/telescope-file-browser.nvim')

local actions = require('telescope').extensions.file_browser.actions

require('telescope').setup({
	extensions = {
		file_browser = {
			hijack_netrw = false,
			mappings = {
				['i'] = {
					-- FIX:
					['<C-c>'] = actions.create,
					['<C-r>'] = actions.remove,
				},
			},
		};
	};
})


vim.keymap.set('n', '<leader>eb',
	require('telescope.').extensions.file_browser.file_browser,
	{ desc = 'Open Telescope file browser', }
)



