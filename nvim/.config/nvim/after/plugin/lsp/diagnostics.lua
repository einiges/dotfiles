vim.diagnostic.config({
	signs = {
		severity = vim.diagnostic.severity.WARN,
	},

	severity_sort = true,

	-- FIX: ts_autotag may require `update_in_insert = true`.
	update_in_insert = false,

	virtual_text = {
		source = true,
	},
})

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local signs = {
	Error = ' ',
	Warn = '',
	Hint = ' ',
	Info = ' ',
}

for type, icon in pairs(signs) do
	local name = 'DiagnosticSign' .. type
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name })
end
