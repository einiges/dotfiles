
local servers = {
	'clangd',
	'jdtls',
	'lemminx',
	'sumneko_lua',
}

-- TODO: Setup :h vim.lsp.buf.document_highlight

require('my.lsp.handlers')
require('my.lsp.diagnostic')

require('lspkind').init()

for _, ls in ipairs(servers) do
	pcall(require, 'my.lsp.providers.' .. ls)
end

