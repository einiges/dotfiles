PAQ('liuchengxu/vista.vim')

vim.g.vista_default_executive = 'nvim_lsp'
vim.g.vista_echo_cursor_strategy = 'floating_win'

vim.g.vista_floating_delay = 50

vim.g.vista_icon_indent = { '╰─  ', '├─  ' }

vim.keymap.set('n', '<leader>mv', '<CMD>Vista!!<CR>',
	{ desc = 'Vista',
	}
)

