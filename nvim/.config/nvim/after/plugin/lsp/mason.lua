PAQ('williamboman/mason.nvim')

if not PREQUIRE('mason') then
	return
end

require('mason').setup({
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
