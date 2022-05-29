
require('paq').register('nvim-telescope/telescope-file-browser.nvim')

require('telescope').setup({
	extensions = {
		file_browser = {
			hijack_netrw = false,
		};
	};
})

require('telescope').load_extension('file_browser')


vim.keymap.set('n', '<leader>eb',
	require('telescope.').extensions.file_browser.file_browser,
	{ desc = 'Open Telescope file browser', }
)



