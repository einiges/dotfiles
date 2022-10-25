local sumneko_root = vim.fn.stdpath('data')
	.. '/lsp-servers/packages/lua-language-server/extension/server'
local sumneko_bin = sumneko_root .. '/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local settings = {
	Lua = {
		runtime = {
			version = 'LuaJIT',
			path = runtime_path,
		},
		diagnostics = {
			globals = {
				'vim',
			},
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file('', true),
		},
		telemetry = {
			enable = false,
		},
	},
}

require('lspconfig').sumneko_lua.setup({
	cmd = { sumneko_bin, '-E', sumneko_root .. '/main.lua' },
	settings = settings,
	capabilities = require('my.lsp.capabilities'),
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
})
