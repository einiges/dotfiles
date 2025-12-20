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
				['af'] = {
					query = '@function.outer',
					desc = 'A function',
				},
				['if'] = {
					query = '@function.inner',
					desc = 'Inner function',
				},
				['ac'] = {
					query = '@class.outer',
					desc = 'A class',
				},
				['ic'] = {
					query = '@class.inner',
					desc = 'Inner class',
				},
				['al'] = {
					query = '@loop.outer',
					desc = 'A loop',
				},
				['il'] = {
					query = '@loop.inner',
					desc = 'Inner loop'
				},
				['a-'] = {
					query = '@comment.outer',
					desc = 'A comment',
				},
				['aß'] = {
					query = '@block.outer',
					desc = 'A block'
				},
			},
		},

		swap = {
			enable = true,
			swap_next = {
				['<leader>sa'] = {
					query = '@parameter.inner',
					desc = 'Swap with next parameter',
				},
				['<leader>sf'] = {
					query = '@function.outer',
					desc = 'Swap with next function'
				}
			},
			swap_previous = {
				['<leader>Sa'] = {
					query = '@parameter.inner',
					desc = 'Swap with previous parameter',
				},
				['<leader>Sf'] = {
					query = '@function.outer',
					desc = 'Swap with previous function'
				}
			},
		},

		move = {
			enable = true,
			set_jumbs = false,
			goto_next_start = {
				[']m'] = {
					query = '@function.outer',
					desc = 'Next function start',
				},
				[']]'] = {
					query = '@class.outer',
					desc = 'Next class start',
				},
			},
			goto_next_end = {
				[']M'] = {
					query = '@function.outer',
					desc = 'Next function end',
				},
				[']['] = {
					query = '@class.outer',
					desc = 'Next class end',
				},
			},
			goto_previous_start = {
				['[m'] = {
					query = '@function.outer',
					desc = 'Previous function start',
				},
				['[['] = {
					query = '@class.outer',
					desc = 'Previous class start',
				}
			},
			goto_previous_end = {
				['[M'] = {
					query = '@function.outer',
					desc = 'Previous function end',
				},
				['[]'] = {
					query = '@class.outer',
					desc = 'Previous class end',
				},
			},
		},

	},
})

