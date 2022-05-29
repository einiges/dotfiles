require('paq').register('nvim-treesitter/playground')

if not pcall(require, 'nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup {
	playground = {
		enable = true,
		updatetime = 25,
	},
}

