PAQ('SmiteshP/nvim-navic')

if not PREQUIRE('nvim-navic') then
	return
end


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('StartNavic', {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.documentSymbolProvider then
			require('nvim-navic').attach(client, args.buf)
		end
	end,
})

