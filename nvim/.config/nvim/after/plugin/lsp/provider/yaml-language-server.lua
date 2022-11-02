require('lspconfig').yamlls.setup({
	capabilities = require('my.lsp.capabilities'),
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
})
