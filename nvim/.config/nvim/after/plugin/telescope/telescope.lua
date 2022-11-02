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
		layout_strategy = 'horizontal',
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},
	},
}


-- Keymaps
local map = require('my.utils.nvim.keymap')()

-- code
map:setX('<leader>sd', require('telescope.builtin').diagnostics,
	{ desc = 'Show diagnostics' })
map:setX('<leader>sq', require('telescope.builtin').quickfix,
	{ desc = 'Show quickfix' })


-- files
map:setX('<leader>ff',
	function() require('telescope.builtin').find_files({follow=true}) end,
	{ desc = 'Find files by name' })
map:setX('<leader>fg', require('telescope.builtin').live_grep,
	{ desc = 'Find files by content' })
map:setX('<leader>fF', require('telescope.builtin').git_files,
	{ desc = 'Find tracked git files' })
map:setX('<leader>fo', require('telescope.builtin').oldfiles,
	{ desc = 'Find old files by name' })

-- nvim
map:setX('<leader>fb', require('telescope.builtin').buffers,
	{ desc = 'Find nvim buffers' })
map:setX('<leader>fG', require('telescope.builtin').current_buffer_fuzzy_find,
	{ desc = 'Find text in current buffer' })

map:setX('<leader>hh', require('telescope.builtin').help_tags,
	{ desc = 'Nvim help' })
map:setX('<leader>hc', require('telescope.builtin').highlights,
	{ desc = 'Nvim highlights' })
map:setX('<leader>hk', require('telescope.builtin').keymaps,
	{ desc = 'Nvim keymaps' })

