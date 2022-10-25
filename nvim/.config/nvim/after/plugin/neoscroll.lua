PAQ('karb94/neoscroll.nvim')

if not PREQUIRE('neoscroll') then
	return
end

require('neoscroll').setup({
	mappings = {
		'<C-u>', '<C-d>',
		'<C-b>', '<C-f>',
		'<C-y>', '<C-e>',
	},
	easing_function = 'circular',
})

