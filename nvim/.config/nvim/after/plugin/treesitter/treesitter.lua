PAQ({ 'nvim-treesitter/nvim-treesitter',
	run = function()
		vim.api.nvim_cmd({ cmd = 'TSUpdate' }, {})
	end
})

if not PREQUIRE('nvim-treesitter.configs') then
	return
end


local parsers = {
	'bash',
	'c',
	'css', 'scss',
	'dockerfile',
	'html',
	'help', -- buggy
	'java',
	'json',
	'latex', 'bibtex',
	'lua',
	'make', 'cmake',
	'markdown',
	'norg',
	'query',
	'regex',
	'sql',
	'toml',
	'yaml',

	'diff',

	'comment',
	'gitattributes',
}

require('nvim-treesitter.configs').setup({
	ensure_installed = parsers,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
