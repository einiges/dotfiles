
require('paq').register('nvim-telescope/telescope-ui-select.nvim')

require('telescope').setup({
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({})
		};
	};
})

require('telescope').load_extension('ui-select')

