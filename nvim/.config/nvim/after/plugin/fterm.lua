require('paq').register('numtostr/FTerm.nvim')

if not pcall(require, 'FTerm') then
	return
end

require('FTerm').setup({
	border = 'double'
})


