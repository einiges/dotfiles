PAQ('ggandor/leap.nvim')
PAQ('ggandor/leap-spooky.nvim')
PAQ('tpope/vim-repeat')

if not PREQUIRE('leap') then
	return
end

local leap = require('leap')

leap.setup({
	highlight_unlabeled_phase_one_targets = true,
	safe_labels = vim.fn.split('uiaevlcnrtdgf', '.\\zs'),
	labels = vim.fn.split('uiaevlcnrtdgf', '.\\zs'),
})
leap.add_default_mappings()

require('leap-spooky').setup({})
