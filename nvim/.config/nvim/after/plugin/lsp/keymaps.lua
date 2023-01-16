
local mappingsP = {
	{ 'definitionProvider', 'n', 'gd', vim.lsp.buf.definition, {
		desc = 'Goto definition',
	}},
	{ 'declarationProvider', 'n', 'gD', vim.lsp.buf.declaration, {
		desc = 'Goto declaration',
	}},
	{ 'implementationProvider', 'n', 'gi', vim.lsp.buf.implementation, {
		desc = 'Goto implementation',
	}},
	{ 'hoverProvider', 'n', 'K', vim.lsp.buf.hover, {
		desc = 'Show documentation',
	}},
	{ 'signatureHelpProvider','n', '<C-k>', vim.lsp.buf.signature_help, {
		desc = 'Show signature help',
	}},
	{ 'codeActionProvider', {'n', 'v'}, '<a-CR>', vim.lsp.buf.code_action, {
		desc = 'Quickfix',
	}},
	{ 'typeDefinitionProvider', 'n', '<leader>D', vim.lsp.buf.type_definition, {
		desc = 'Go to type definition',
	}},
	{ 'renameProvider', 'n', '<leader>rr', vim.lsp.buf.rename, {
		desc = 'Rename',
	}},
	{ 'referencesProvider', 'n', 'gr', vim.lsp.buf.references, {
		desc = 'References',
	}},
	{ 'documentFormattingProvider', 'n', 'gF',
		function()
	vim.lsp.buf.format({ async = true })
		end,
		{
			desc = 'Format',
		}
	},
	-- TODO: Buggy? How is this supposed to work?
	{ 'documentRangeFormattingProvider', 'x', 'gF',
		function()
	vim.lsp.buf.format({ async = true })
		end,
		{
			desc = "Format",
		}
	},
	{ nil, 'n', '<leader>dp', vim.diagnostic.goto_prev, {
		desc = 'Previous diagnostic',
	}},
	{ nil, 'n', '<leader>dn', vim.diagnostic.goto_next, {
		desc = 'Next diagnostic',
	}},
	{ nil, 'n', '<leader>dl', vim.diagnostic.setloclist, {
		desc = '?',
	}},
}


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('LspKeymaps', {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		for _, mappings in pairs(mappingsP) do
			local capability, mode, lhs, rhs, opts = unpack(mappings)
			if capability == nil or client.server_capabilities[capability] then
				vim.keymap.set(mode, lhs, rhs,
					vim.tbl_extend('force', opts or {}, { buffer = args.buf })
				)
			end
		end

	end,
})
