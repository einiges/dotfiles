require('paq').register('ggandor/leap.nvim')
require('paq').register('tpope/vim-repeat')

local ok, leap = pcall(require, 'leap')
if not ok then
	return
end

leap.set_default_keymaps()

