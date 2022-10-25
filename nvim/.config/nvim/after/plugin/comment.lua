-- easy commenting
PAQ('numToStr/Comment.nvim')

if not PREQUIRE('Comment') then
	return
end


require('Comment').setup {
	padding = false,

	extra = {
		eol = 'gcA',
	},
}

