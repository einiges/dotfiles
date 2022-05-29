require('paq').register('romgrk/nvim-treesitter-context')

local ok, context = pcall(require, 'treesitter-context.configs')
if not ok then
	return
end

context.setup {
	enable = true,
	throttle = true,
}

