local M = {}

M.define = function(prefix, signs)
	for type, icon in pairs(signs) do
		local name = prefix .. type
		vim.fn.sign_define(name, {
			text = icon,
			texthl = name,
			linehl = name .. 'Ln',
			numhl = name .. 'Nr',
			culhl = name .. 'Cu',
		})
	end
end

return M
