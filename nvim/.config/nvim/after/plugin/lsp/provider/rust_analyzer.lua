local ra_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/rust-analyzer/'
local ra_bin = ra_root .. '/rust-analyzer'

require('lspconfig').rust_analyzer.setup({
	cmd = { ra_bin },
	capabilities = require('my.lsp.capabilities'),
})

