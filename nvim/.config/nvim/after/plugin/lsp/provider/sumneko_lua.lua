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
			--library = vim.api.nvim_get_runtime_file('', true),
			library = {
				[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
			},
		},
		telemetry = {
			enable = false,
		},
	},
}

require('lspconfig').sumneko_lua.setup({
	settings = settings,
	capabilities = require('my.lsp.capabilities'),
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end,
})
