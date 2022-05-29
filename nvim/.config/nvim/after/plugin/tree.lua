require('paq').register('kyazdani42/nvim-tree.lua')
require('paq').register('kyazdani42/nvim-web-devicons')

local ok, tree = pcall(require, 'nvim-tree')
if not ok then
	return
end

tree.setup {
	actions = {
		open_file = {
			window_picker = {
				enable = true,
				exclude = {
					filetype = {
						'notify',
						'packer',
						'qf',
						'diff',
						'vista',
					},
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		group_empty = true,

	},
	view = {
		hide_root_folder = true,
		--auto_resize = true,
	}
}

vim.keymap.set('n', '<leader>ee', '<CMD>NvimTreeToggle<CR>',
	{ desc = 'Toggle file explorer' })

