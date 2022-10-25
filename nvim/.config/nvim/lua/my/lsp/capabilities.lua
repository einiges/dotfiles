
local capabilities

if pcall(require, 'cmp_nvim_lsp') then
	capabilities = require('cmp_nvim_lsp').default_capabilities()
else
	capabilities  = vim.lsp.protocol.make_client_capabilities()
end

return capabilities

