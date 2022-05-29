
local M = {}

M.on_attach = function(client, bufnr)
	require('my.lsp.keymaps').setup(bufnr)
	require('lsp_signature').setup()
end

return M

