local spec = {
	'neovim/nvim-lspconfig',
	lazy = false,

	dependencies = {
		{ 'mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim', config = function() end },
	},
}

require('lspconfig.ui.windows').default_options.border = 'single'

require('mason-lspconfig').setup({
	automatic_installation = false,

	ensure_installed = {
		--'bashls', -- bash
		--'jdtls', -- java
		--'lemminx', -- XML
		--'perlnavigator', -- perl
		--'rust_analyzer', -- rust
		--'lua_ls', -- lua
		--'taplo', -- TOML
		--'yamlls', -- YAML
	},
})

vim.api.nvim_create_autocmd('User', {
	desc = '',
	pattern = 'LazyLoad',
	callback = function(args)
		print(args.data)
	end
