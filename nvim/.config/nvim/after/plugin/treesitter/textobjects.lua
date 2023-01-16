PAQ('nvim-treesitter/nvim-treesitter-textobjects')

if not PREQUIRE('nvim-treesitter.configs') then
	return
end

require('nvim-treesitter.configs').setup({
	textobjects = {
		lsp_interop = {
			enable = true,
			border = 'single',
			peek_definition_code = {
				['<leader>df'] = '@function.outer',
				['<leader>dF'] = '@class.outer',
			},
		},

		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['aC'] = '@comment.outer',
			},
		},

		swap = {
			enable = true,
			swap_next = {
				['<leader>aa'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>aA'] = '@parameter.inner',
			},
		},

		move = {
			enable = true,
			set_jumbs = false,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
})
