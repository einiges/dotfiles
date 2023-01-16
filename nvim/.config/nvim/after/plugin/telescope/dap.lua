PAQ('nvim-telescope/telescope-dap.nvim')

if not PREQUIRE('telescope') or
	not PREQUIRE('telescope._extensions.dap')
then
	return
end

require('telescope').load_extension('dap')

vim.keymap.set('n', '<leader>fc',
	function()
		require('telescope').extensions.dap.commands({})
	end, {
	desc = 'commands (dap)',
})

vim.keymap.set('n', '<leader>fC',
	function()
		require('telescope').extensions.dap.configurations({})
	end, {
	desc = 'configurations (dap)',
})

vim.keymap.set('n', '<leader>fB',
	function()
		require('telescope').extensions.dap.list_breakpoints({})
	end, {
	desc = 'breakpoints (dap)',
})

vim.keymap.set('n', '<leader>fv',
	function()
		require('telescope').extensions.dap.variables({})
	end, {
	desc = 'variables (dap)',
})

vim.keymap.set('n', '<leader>fr',
	function()
		require('telescope').extensions.dap.frames({})
	end, {
	desc = 'frames (dap)',
})
