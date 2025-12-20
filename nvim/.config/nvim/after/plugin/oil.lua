PAQ('stevearc/oil.nvim')

if not PREQUIRE('oil') then
	return
end

require('oil').setup()

vim.keymap.set('n', '<leader>O',
	function()
		require('oil').open()
	end, {
		desc = 'File explorer',
})

