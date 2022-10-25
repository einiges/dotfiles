local sqls_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/sqls'
local sqls_bin = vim.fn.glob(sqls_root .. '/sqls')

require('lspconfig').perlnavigator.setup({
	-- TODO
	cmd = { sqls_bin, '-config', 'path/to/config.yaml' },
	capabilities = require('my.lsp.capabilities'),
})


