require('lspconfig').perlnavigator.setup({
	capabilities = require('my.lsp.capabilities'),
	settings = {
		perlnavigator = {
			perlPath = '/usr/bin/perl',
		},
	},
})
