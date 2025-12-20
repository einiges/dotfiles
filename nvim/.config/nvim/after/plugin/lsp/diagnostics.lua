vim.diagnostic.config({
	--signs = {
	--	severity = vim.diagnostic.severity.WARN,
	--},
	signs = {

	},

	severity_sort = true,

	update_in_insert = false,

	--virtual_text = {
	--	source = false,
	--},
	virtual_text = {
		only_current_line = true,
	},
	underline = true,

	float = {
		focus = false,
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = 'if_many',
		header = '',
		prefix = '',
	},
})

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
require('my.utils.nvim.sign').define('DiagnosticSign', {
	Error = '𝔼',
	Warn = '𝕎',
	Hint = 'ℍ',
	Info = '𝕀',
})

vim.keymap.set('n', '<leader>i',
	function()
		vim.diagnostic.open_float(nil, {
			focus = false,
			scope = 'cursor',
		})
	end,
	{
		desc = 'Show diagnostic',
	}
)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('DiagnosticKeymaps', {}),
	callback = function(args)

		vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev, {
			desc = 'Previous diagnostic',
			buffer = args.buf,
		})

		vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next, {
			desc = 'Next diagnostic',
			buffer = args.buf,
		})

		--vim.keymap.set('n', '<leader>fd', vim.diagnostic.setloclist, {
		--	desc = 'List diagnostic',
		--	buffer = args.buf,
		--})

	end
})

