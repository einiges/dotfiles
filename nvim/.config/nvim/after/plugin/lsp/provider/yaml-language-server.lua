local yamlls_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/yaml-language-server'
local yamlls_bin = vim.fn.glob(yamlls_root .. '/node_modules/yaml-language-server/bin/yaml-language-server')

require('lspconfig').yamlls.setup({
	cmd = { yamlls_bin, '--stdio' },
	capabilities = require('my.lsp.capabilities'),
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
})


