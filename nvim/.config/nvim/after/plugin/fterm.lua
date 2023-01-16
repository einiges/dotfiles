PAQ('numtostr/FTerm.nvim')

if not PREQUIRE('FTerm') then
	return
end

require('FTerm').setup({
	border = 'double'
})

vim.keymap.set('n', '<leader>T', function() require('FTerm').toggle() end)

