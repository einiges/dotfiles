PAQ('SmiteshP/nvim-navic')

if not PREQUIRE('nvim-navic') then
	return
end

require('nvim-navic').setup({
	highlight = true,
	sparator = ' ▶ '
})

local attach = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if client.server_capabilities.documentSymbolProvider then
		require('nvim-navic').attach(client, args.buf)
	end
end

vim.api.nvim_create_autocmd('LspAttach', {
	desc = [[Attach Navic]],
	group = vim.api.nvim_create_augroup('MyAttachNavic', {}),
	callback = attach,
})
