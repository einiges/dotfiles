require('paq').register({ 'nvim-treesitter/nvim-treesitter',
	run = function()
		vim.api.nvim_cmd({ cmd = 'TSUpdate' }, {})
	end
})

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

local parsers = {
	'bash',
	'c',
	'css', 'scss',
	'dockerfile',
	'html',
	--'help', -- buggy
	'java',
	'json',
	'latex', 'bibtex',
	'lua',
	'make', 'cmake',
	'markdown',
	'norg',
	'query',
	'regex',
	'toml',
	'yaml',
}

treesitter.setup {
	ensure_installed = parsers,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
}

