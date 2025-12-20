PAQ('nvim-telescope/telescope.nvim')
PAQ('nvim-lua/popup.nvim')
PAQ('nvim-lua/plenary.nvim')

local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		color_devicons = false,
		layout_strategy = 'horizontal',
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},
	},
}


-- Keymaps
local map = vim.keymap.set
-- code
map('n', '<leader>fd',
	function() require('telescope.builtin').diagnostics() end,
	{ desc='Show diagnostics', }
)

map('n', '<leader>fq',
	function() require('telescope.builtin').quickfix() end,
	{ desc = 'Show quickfix', }
)


-- files
map('n', '<leader>ff',
	function() require('telescope.builtin').find_files({follow=true}) end,
	{ desc = 'Find files by name', }
)

map('n', '<leader>fF',
	function() require('telescope.builtin').git_files() end,
	{ desc = 'Find tracked git files by name', }
)

map('n', '<leader>fo',
	function() require('telescope.builtin').oldfiles() end,
	{ desc = 'Find old files by name' , }
)

map('n', '<leader>fg',
	function() require('telescope.builtin').live_grep() end,
	{ desc = 'Find files by content', }
)

map('n', '<leader>fG',
	function() require('telescope.builtin').current_buffer_fuzzy_find() end,
	{ desc = 'Find text in current buffer', }
)


-- nvim
map('n', '<leader>fb',
	function() require('telescope.builtin').buffers() end,
	{ desc = 'Find nvim buffers', }
)

map('n', '<leader>fh',
	function() require('telescope.builtin').help_tags() end,
	{ desc = 'Nvim help', }
)

map('n', '<leader>fc',
	function() require('telescope.builtin').highlights() end,
	{ desc = 'Nvim highlights', }
)

map('n', '<leader>fk',
	function() require('telescope.builtin').keymaps() end,
	{ desc = 'Nvim keymaps', }
)

