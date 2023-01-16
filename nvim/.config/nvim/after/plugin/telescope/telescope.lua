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
local map = require('my.utils.nvim.keymap')()

-- code
map
	:desc('Show diagnostics')
	:setX('<leader>fd',
	function() require('telescope.builtin').diagnostics() end)

map
	:desc('Show quickfix')
	:setX('<leader>q',
	function() require('telescope.builtin').quickfix() end)


-- files
map
	:desc('Find files by name')
	:setX('<leader>ff',
	function() require('telescope.builtin').find_files({follow=true}) end)

map
	:desc('Find tracked git files by name')
	:setX('<leader>fF',
	function() require('telescope.builtin').git_files() end)

map
	:desc('Find old files by name' )
	:setX('<leader>fo',
	function() require('telescope.builtin').oldfiles() end)

map
	:desc('Find files by content')
	:setX('<leader>fg',
	function() require('telescope.builtin').live_grep() end)

map
	:desc('Find text in current buffer' )
	:setX('<leader>fG',
	function() require('telescope.builtin').current_buffer_fuzzy_find() end)


-- nvim
map
	:desc('Find nvim buffers' )
	:setX('<leader>fb',
	function() require('telescope.builtin').buffers() end)

map
	:desc('Nvim help' )
	:setX('<leader>hh',
	function() require('telescope.builtin').help_tags() end)
map
	:desc('Nvim highlights' )
	:setX('<leader>hc',
	function() require('telescope.builtin').highlights() end)
map
	:desc('Nvim keymaps' )
	:setX('<leader>hk',
	function() require('telescope.builtin').keymaps() end)

