PAQ('mhinz/vim-sayonara') -- Closing of buffers

vim.keymap.set('n', 'qQ', '<cmd>Sayonara<CR>', {
	desc = 'Delete buffer and close window'
})
vim.keymap.set('n', 'qq', '<cmd>Sayonara!<CR>', {
	desc = 'Delete buffer and preserve window'
})

