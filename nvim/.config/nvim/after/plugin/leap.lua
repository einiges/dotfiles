PAQ('ggandor/leap.nvim')
PAQ('tpope/vim-repeat')

if not PREQUIRE('leap') then
	return
end

require('leap').set_default_keymaps()

