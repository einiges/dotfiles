require('paq').register('akinsho/bufferline.nvim')
require('paq').register('kyazdani42/nvim-web-devicons')

if not pcall(require, 'bufferline') then
	return
end

require('bufferline').setup {
	options = {
		indicator_icon = ' ',
	},
}

