require('paq').register('williamboman/nvim-lsp-installer')

if not pcall(require, 'nvim-lsp-installer') then
	return
end

local servers = {
	'jdtls',
	'lemminx',
}

require('nvim-lsp-installer').setup({
	automatic_installation = true,
	ensure_installed = servers,
})

