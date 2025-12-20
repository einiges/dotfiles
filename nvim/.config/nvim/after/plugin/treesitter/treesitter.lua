PAQ({ 'nvim-treesitter/nvim-treesitter',
	build = function()
		vim.api.nvim_cmd({ cmd = 'TSUpdate' }, {})
	end
})

if not PREQUIRE('nvim-treesitter.configs') then
	return
end


local parsers = {
	'bash',

	'dockerfile',
	'make', 'cmake',

	'c',
	'java',
	'perl',
	'rust',

	-- web
	'css', 'scss',
	'html',

	'json',
	'toml',
	'yaml',

	'markdown',
	'norg',

	'query',
	'regex',
	'sql',

	'diff',

	--'comment',
	'gitattributes',
}

require('nvim-treesitter.configs').setup({
	ensure_installed = parsers,

	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	indent = {
		enable = true,
	},
})
