PAQ('folke/todo-comments.nvim')

if not PREQUIRE('todo-comments') then
	return true
end

require('todo-comments').setup {
	highlight = {
		max_line_len = 200,
		exclude = {
			'man',
			'term',
			'',
		},
	},
}

