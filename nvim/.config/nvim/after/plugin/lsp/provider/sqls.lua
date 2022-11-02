local sqls_bin = vim.fn.stdpath('data') .. '/mason/bin/sqls'

require('lspconfig').sqlls.setup({
	-- TODO:
	cmd = { sqls_bin, '-config', 'path/to/config.yaml' },
	capabilities = require('my.lsp.capabilities'),
})


