vim.diagnostic.config({
	signs = {
		severity = vim.diagnostic.severity.WARN,
	},

	severity_sort = true,

	-- FIX: ts_autotag may require `update_in_insert = true`.
	update_in_insert = false,

	virtual_text = {
		source = true,
	},
})

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
require('my.utils.nvim.sign').define('DiagnosticSign', {
	Error = ' ',
	Warn = '',
	Hint = ' ',
	Info = ' ',
})

