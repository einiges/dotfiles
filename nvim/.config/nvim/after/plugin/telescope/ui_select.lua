PAQ('nvim-telescope/telescope-ui-select.nvim')

if not pcall(require, 'telescope')
or not pcall(require, 'telescope._extensions.ui-select')
then
	return
end

require('telescope').setup({
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({})
		};
	};
})

require('telescope').load_extension('ui-select')

