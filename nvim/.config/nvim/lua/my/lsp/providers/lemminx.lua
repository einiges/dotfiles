
local M = {}

local lemminx_root = vim.fn.stdpath('data') .. '/lsp_servers/lemminx'
local lemminx_bin = lemminx_root .. '/lemminx'

M.setup = function()

	require('lspconfig').lemminx.setup({
		cmd = { lemminx_bin },
		capabilities = require('my.lsp.capabilities').setup(),
		on_attach = require('my.lsp.on_attach').on_attach,
	})

end

M.setup()

return M

