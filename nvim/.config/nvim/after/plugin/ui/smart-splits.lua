-- Natural split resizing
PAQ('mrjones2014/smart-splits.nvim')

if not PREQUIRE('smart-splits') then
	return
end

local ss = require('smart-splits')

vim.keymap.set({ 'n', 't' }, '<C-Left>', ss.move_cursor_left,
	{ desc = 'Select ◀' })
vim.keymap.set({ 'n', 't' }, '<C-Down>', ss.move_cursor_down,
	{ desc = 'Select ▼' })
vim.keymap.set({ 'n', 't' }, '<C-Up>', ss.move_cursor_up,
	{ desc = 'Select ▲' })
vim.keymap.set({ 'n', 't' }, '<C-Right>', ss.move_cursor_right,
	{ desc = 'Select ▶' })

local has_hydra, Hydra = PREQUIRE('hydra')
if not has_hydra then
	return
end

Hydra({
	name = 'Buffer Resize',
	mode = 'n',
	body = '<leader>b',
	heads = {
		{ 'n', function() ss.resize_left(8) end, {
			desc = 'resize ◀'
		} },
		{ 'r', function() ss.resize_down(3) end, {
			desc = 'resize ▼'
		} },
		{ 't', function() ss.resize_up(3) end, {
			desc = 'Resize ▲'
		} },
		{ 'd', function() ss.resize_right(8) end, {
			desc = 'Resize ▶'
		} },
	},
})
