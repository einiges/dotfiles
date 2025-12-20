
local conditionalMappings = {

	{ 'n', 'gd', vim.lsp.buf.definition,
		{
			desc = 'Go to definition',
		},
		'definitionProvider'
	},


	{ 'n', 'gD', vim.lsp.buf.declaration,
		{
			desc = 'Go to declaration',
		},
		'declarationProvider'
	},

	{ 'n', 'gi', vim.lsp.buf.implementation,
		{
			desc = 'Go to implementation',
		},
		'implementationProvider'
	},

	{ 'n', 'gr', vim.lsp.buf.references, {
		desc = 'References',
		},
		'referencesProvider'
	},

	{ 'n', 'gW', vim.lsp.buf.workspace_symbol, {
		desc = 'Go to workspace symbol',
		},
		'workspaceSymbolProvider'
	},

	{ 'n', 'K', vim.lsp.buf.hover, {
		desc = 'Show documentation',
		},
		'hoverProvider'
	},

	{ 'n', '<C-k>', vim.lsp.buf.signature_help, {
		desc = 'Show signature help',
		},
		'signatureHelpProvider'
	},

	{ {'n', 'x'}, '<a-CR>', vim.lsp.buf.code_action, {
		desc = 'Code action',
		},
		'codeActionProvider'
	},

	{ {'n', 'x'}, '<leader>r',
			function()
				vim.lsp.buf.code_action({
					context = {
						only = {
							'refactor'
						}
					}
				})
			end, {
			desc = 'Code action (refactor)',
		},
		'codeActionProvider'
	},

	{ 'n', 'gt', vim.lsp.buf.type_definition, {
		desc = 'Go to type definition',
		},
		'typeDefinitionProvider'
	},

	{ 'n', '<leader>rr', vim.lsp.buf.rename, {
		desc = 'Rename',
		},
		'renameProvider'
	},
}

-- TODO: Keymap workspaces
-- vim.lsp.buf.add_workspace_folder
-- vim.lsp.buf.remove_workspace_folder


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('LspKeymaps', {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		for _, definition in pairs(conditionalMappings) do
			local mode, lhs, rhs, opts, capability = unpack(definition)
			if client.server_capabilities[capability] then
				opts = opts or {}
				opts.buffer = args.buf

				vim.keymap.set(mode, lhs, rhs, opts)
			end
		end
	end,
})
