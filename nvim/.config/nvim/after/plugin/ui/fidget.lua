if pcall(require, 'noice') then
	return
end

PAQ('j-hui/fidget.nvim')

if not PREQUIRE('fidget') then
	return
end

require('fidget').setup({})
