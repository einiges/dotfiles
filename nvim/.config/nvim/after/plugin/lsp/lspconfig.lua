PAQ('neovim/nvim-lspconfig')
PAQ('williamboman/mason-lspconfig.nvim')

if not PREQUIRE('mason-lspconfig') or not PREQUIRE('lspconfig') then
	return
end

require('lspconfig.ui.windows').default_options.border = 'single'

require('mason-lspconfig').setup({
	automatic_installation = false,

	ensure_installed = {
		'bashls', -- bash
		'jdtls', -- java
		'lemminx', -- XML
		'perlnavigator', -- perl
		'rust_analyzer', -- rust
		'sumneko_lua', -- lua
		'taplo', -- TOML
		'yamlls', -- YAML
	},
})
