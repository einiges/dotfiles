PAQ('romgrk/nvim-treesitter-context')

if not PREQUIRE('treesitter-context.configs') then
	return
end

require('treesitter-context.configs').setup {
	enable = true,
	throttle = true,
}

