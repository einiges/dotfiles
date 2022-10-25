local pn_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/perlnavigator'
local pn_bin = vim.fn.glob(pn_root .. '/perlnavigator')

require('lspconfig').perlnavigator.setup({
	cmd = { pn_bin, pn_root .. '/node_modules/perlnavigator-server/out/server.js', '--stdio' },
	capabilities = require('my.lsp.capabilities'),
	settings = {
		perlnavigator = {
			perlPath = '/usr/bin/perl',
		},
	},
})

