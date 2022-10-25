
local M = {}

M.applyTheme = function(theme)

	for group, def in pairs(theme) do
		vim.api.nvim_set_hl(0, group, def)
	end

end


return M
