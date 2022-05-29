	-- Pretty higlight for  TODO: comments
require('paq').register('folke/todo-comments.nvim')

local ok, todo = pcall(require, 'todo-comments')
if not ok then
	return
end

todo.setup {
	highlight = {
		max_line_len = 200,
		exclude = {
			'man',
			'term',
			'',
		},
	},
}

