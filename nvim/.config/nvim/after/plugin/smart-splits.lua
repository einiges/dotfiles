-- Natural split resizing
require('paq').register('mrjones2014/smart-splits.nvim')

local ok, ss = pcall(require, 'smart-splits')
if not ok then
	return
end

vim.keymap.set('n', '<C-Left>' , ss.move_cursor_left)
vim.keymap.set('n', '<C-Down>' , ss.move_cursor_down)
vim.keymap.set('n', '<C-Up>'   , ss.move_cursor_up)
vim.keymap.set('n', '<C-Right>', ss.move_cursor_right)

vim.keymap.set('n', '<M-Left>' , function() ss.resize_left(8) end)
vim.keymap.set('n', '<M-Down>' , function() ss.resize_down(3) end)
vim.keymap.set('n', '<M-Up>'   , function() ss.resize_up(3) end)
vim.keymap.set('n', '<M-Right>', function() ss.resize_right(8) end)

