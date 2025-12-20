
P = function(value)
	vim.pretty_print(value)
	return value
end

PREQUIRE = function(mod)
	return pcall(require, mod)
end

LOAD = function(mod)
	vim.cmd.packadd(mod)
	return function()
		return pcall(require, mod)
	end
end

--- Unload mod
RELOAD = function(mod)
	package.loaded[mod] = nil
	return require(mod)
end

