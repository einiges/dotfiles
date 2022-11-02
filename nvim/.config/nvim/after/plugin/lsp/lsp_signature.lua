PAQ('ray-x/lsp_signature.nvim')

if not PREQUIRE('lsp_signature') then
	return
end

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('LspSignatureAttach', {}),
	once = true,
	callback = function()
		require('lsp_signature').setup({
			bind = true,
			handler_opts = {
				border = 'double',
			},
		})
	end,
})

