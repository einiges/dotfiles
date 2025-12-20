-- Indention guides
PAQ('lukas-reineke/indent-blankline.nvim')


if not PREQUIRE('indent_blankline') then
	return
end

require('ibl').setup {
	-- char_highlight_list = {
	-- 	'IndentBlanklineIndent1',
	-- 	'IndentBlanklineIndent2',
	-- },

	indent = {
		char = '│',
	},

	-- use_treesitter = true,
	--disable_with_nolist = true,
	-- max_indent_increase = 1,

	--show_current_context = true,
	--context_patterns = {
	--	'class',
	--	'function',
	--	'method',
	--	'^if',
	--	'while',
	--	'for',
	--	'with',
	--	'func_literal',
	--	'block',
	--	'try',
	--	'except',
	--	'argument_list',
	--	'object',
	--	'dictionary',
	--	'element',
	--},

	exclude = {
		filetypes = {
			'',
			'plaintex',
			'text',
			'help',
			'man',
		},
		buftypes = {
			'terminal',
			'nofile',
		}
	},
}


