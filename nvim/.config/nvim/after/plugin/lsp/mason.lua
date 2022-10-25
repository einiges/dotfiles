PAQ('williamboman/mason.nvim')

if not PREQUIRE('mason') then
	return
end

require('mason').setup({
	install_root_dir = require('mason-core.path').concat({
		vim.fn.stdpath('data'),
		'lsp-servers',
	}),

	ui = {
		border = 'single',

		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		},
	},

	keymaps = {
		uninstall_package = 'd',
	},
})
