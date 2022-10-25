local taplo_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/taplo'
local taplo_bin = vim.fn.glob(taplo_root .. '/taplo')

--if taplo_bin == nil then
--	return
--end

require('lspconfig').taplo.setup({
	cmd = { taplo_bin, 'lsp', 'stdio' },
	capabilities = require('my.lsp.capabilities'),
})

