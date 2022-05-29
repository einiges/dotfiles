vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('DetectTerm', {clear = true}),
	pattern = 'term://*',
	callback = function()
		vim.opt_local.filetype = 'term'
	end,
})

