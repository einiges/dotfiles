PAQ('stevearc/oil.nvim')

if not PREQUIRE('oil') then
	return
end

require('oil').setup()

vim.keymap.set('n', '<leader>o', require('oil').open, {
	desc = 'Open parent directory',
})

