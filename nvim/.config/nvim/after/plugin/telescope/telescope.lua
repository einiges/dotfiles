--   Telescope
require('paq').register('nvim-telescope/telescope.nvim')
require('paq').register('nvim-lua/popup.nvim')
require('paq').register('nvim-lua/plenary.nvim')

local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		layout_strategy = 'horizontal',
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},
	},
}
--telescope.load_extension('dap')


-- Keymaps
local map = require('my.utils.nvim.keymap')()

-- code
map:set('n', '<leader>sd', require('telescope.builtin').diagnostics,
	{ desc = 'Show diagnostics' })
map:set('n', '<leader>sq', require('telescope.builtin').quickfix,
	{ desc = 'Show quickfix' })


-- files
map:set('n', '<leader>ff',
	function() require('telescope.builtin').find_files({follow=true}) end,
	{ desc = 'Find files by name' })
map:set('n', '<leader>fg', require('telescope.builtin').live_grep,
	{ desc = 'Find files by content' })
map:set('n', '<leader>fo', require('telescope.builtin').oldfiles,
	{ desc = 'Find old files by name' })

-- nvim
map:set('n', '<leader>hh', require('telescope.builtin').help_tags,
	{ desc = 'Nvim help' })
map:set('n', '<leader>hc', require('telescope.builtin').highlights,
	{ desc = 'Nvim highlights' })
map:set('n', '<leader>hk', require('telescope.builtin').keymaps,
	{ desc = 'Nvim keymaps' })
map:set('n', '<leader>fb', require('telescope.builtin').buffers,
	{ desc = 'Nvim buffers' })

