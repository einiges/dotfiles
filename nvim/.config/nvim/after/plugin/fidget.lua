require('paq').register('j-hui/fidget.nvim')

if not pcall(require, 'fidget') then
	return
end

require('fidget').setup({})
