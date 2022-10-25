local clangd_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/clangd/'
local clangd_bin = vim.fn.glob(clangd_root .. '/clangd')

require('lspconfig').clangd.setup({
	cmd = { clangd_bin },
	capabilities = require('my.lsp.capabilities'),
})

