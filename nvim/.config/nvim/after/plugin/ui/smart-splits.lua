-- Natural split resizing
PAQ('mrjones2014/smart-splits.nvim')

vim.keymap.set({ 'n', 't' }, '<C-Left>',
	function()
		require('smart-splits').move_cursor_left()
	end,
	{ desc = 'Select ◀', }
)

vim.keymap.set({ 'n', 't' }, '<C-Down>',
	function()
		require('smart-splits').move_cursor_down()
	end,
	{ desc = 'Select ▼', }
)

vim.keymap.set({ 'n', 't' }, '<C-Up>',
	function()
		require('smart-splits').move_cursor_up()
	end,
	{ desc = 'Select ▲', }
)

vim.keymap.set({ 'n', 't' }, '<C-Right>',
	function()
		require('smart-splits').move_cursor_right()
	end,
	{ desc = 'Select ▶', }
)


local has_hydra, Hydra = PREQUIRE('hydra')
if not has_hydra then
	return
end

Hydra({
	name = 'Window',
	mode = 'n',
	body = '<leader>w',
	heads = {

		-- resize windows
		{ 'n',
			function()
				require('smart-splits').resize_left(8)
			end, {
			desc = 'Resize ◀',
		} },
		{ 'r',
			function()
				require('smart-splits').resize_down(3)
			end, {
			desc = 'Resize ▼',
		} },
		{ 't',
			function()
				require('smart-splits').resize_up(3)
			end, {
			desc = 'Resize ▲',
		} },
		{ 'd',
			function()
				require('smart-splits').resize_right(8)
			end, {
			desc = 'Resize ▶',
		} },

		-- swap windows
		{ 'N',
			'<C-w>H', {
			desc = 'Swap ◀',
		} },
		{ 'R',
			'<C-w>J', {
			desc = 'Swap ▼',
		} },
		{ 'T',
			'<C-w>K', {
			desc = 'Swap ▲',
		} },
		{ 'D',
			'<C-w>L', {
			desc = 'Swap ▶',
		} },

		-- select windows
		{ 'h',
			function()
				require('smart-splits').move_cursor_left()
			end, {
			desc = 'Select ◀',
		} },
		{ 'g',
			function()
				require('smart-splits').move_cursor_up()
			end, {
			desc = 'Select ▼',
		} },
		{ 'f',
			function()
				require('smart-splits').move_cursor_down()
			end, {
			desc = 'Select ▲',
		} },
		{ 'q',
			function()
				require('smart-splits').move_cursor_right()
			end, {
			desc = 'Select ▶',
		} },


	},
})

