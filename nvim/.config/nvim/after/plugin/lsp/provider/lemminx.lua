local lemminx_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/lemminx'
local lemminx_bin = lemminx_root .. '/lemminx'

-- TODO: Test if installed

require('lspconfig').lemminx.setup({
	cmd = { lemminx_bin },
	capabilities = require('my.lsp.capabilities'),
})

