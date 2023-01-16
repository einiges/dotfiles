PAQ('ggandor/leap.nvim')
PAQ('ggandor/leap-spooky.nvim')
PAQ('ggandor/flit.nvim')

if not PREQUIRE('leap') then
	return
end

local leap = require('leap')

leap.opts.highlight_unlabeled_phase_one_targets = true
leap.opts.safe_labels = vim.fn.split('uiaevlcnrtdgf', '.\\zs')
leap.opts.labels = vim.fn.split('uiaevlcnrtdgf', '.\\zs')

leap.add_default_mappings()

require('leap-spooky').setup({})

require('flit').setup()

