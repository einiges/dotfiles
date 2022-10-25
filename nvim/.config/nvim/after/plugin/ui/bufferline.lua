PAQ('akinsho/bufferline.nvim')
PAQ('kyazdani42/nvim-web-devicons')

if not PREQUIRE('bufferline') then
	return
end

require('bufferline').setup {
	options = {
		indicator = {
			style = 'none',
		},
		color_icons = false,
		sort_by = 'directory',
	},
}

