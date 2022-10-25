-- Indention guides
PAQ('lukas-reineke/indent-blankline.nvim')


if not PREQUIRE('indent_blankline') then
	return
end

require('indent_blankline').setup {
	-- char_highlight_list = {
	-- 	'IndentBlanklineIndent1',
	-- 	'IndentBlanklineIndent2',
	-- },
	show_trailing_blankline_indent = false,

	char = '│',
	-- use_treesitter = true,
	disable_with_nolist = true,
	-- max_indent_increase = 1,

	show_current_context = true,
	context_patterns = {
		'class',
		'function',
		'method',
		'^if',
		'while',
		'for',
		'with',
		'func_literal',
		'block',
		'try',
		'except',
		'argument_list',
		'object',
		'dictionary',
		'element',
	},

	filetype_exclude = {
		'',
		'plaintex',
		'text',
		'help',
		'man',
	},
	buftype_exclude = {
		'terminal',
		'nofile',
	},
}


