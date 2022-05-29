
local M = {}

M.prequire = function(mod)
	local ok, res = pcall(require, mod)
	if not ok then
		vim.notify(
			string.format("module '%s' not found", mod),
			vim.log.levels.WARN)
		return ok
	end

	return res
end

M.reload = function(mod)
	package.loaded[mod] = nil
	return M.module.prequire(mod)
end

return M

