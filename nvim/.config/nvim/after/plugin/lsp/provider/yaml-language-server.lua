require('lspconfig').yamlls.setup({
	capabilities = require('my.lsp.capabilities'),
	settings = {
		yaml = {
			schemas = {
				['https://json.schemastore.org/liquibase'] = 'db/**/*.yaml'
			},
		},
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
})
