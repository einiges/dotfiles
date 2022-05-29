require('paq').register('nvim-treesitter/nvim-treesitter-textobjects')

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

treesitter.setup {
	textobjects = {
		lsp_interop = {
			enable = true,
		},

		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},

		move = {
			enable = true,
			set_jumbs = false,
			goto_next_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_next_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			goto_previous_start = {
				["]m"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_end = {
				["]M"] = "@function.outer",
				["]]"] = "@class.outer",
			},
		},
	},
}

