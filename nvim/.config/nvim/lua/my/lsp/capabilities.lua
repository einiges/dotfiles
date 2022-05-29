
local M = {}

M.setup = function() 
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
	return capabilities
end

return M

