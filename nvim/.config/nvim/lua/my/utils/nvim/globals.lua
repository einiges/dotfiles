
P = function(value)
	vim.pretty_print(value)
	return value
end

PREQUIRE = function(mod)
	return pcall(require, mod)
end

RELOAD = function(mod)
	package.loaded[mod] = nil
	return require(mod)
end

