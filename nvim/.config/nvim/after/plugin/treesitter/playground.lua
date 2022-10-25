PAQ('nvim-treesitter/playground')

if not PREQUIRE('nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup({
	playground = {
		enable = true,
		updatetime = 25,
	},
})
