
local M = {}

M.setup = function(bufnr)
	local map = require('my.utils.nvim.keymap')({buffer = bufnr})

	map:set('n', 'K', vim.lsp.buf.hover, {
		desc = 'Show documentation',
	})
	map:set('n', 'gd', vim.lsp.buf.definition, {
		desc = 'Goto definition',
	})
	map:set('n', 'gD', vim.lsp.buf.declaration, {
		desc = 'Goto declaration',
	})
	map:set('n', 'gi', vim.lsp.buf.implementation, {
		desc = 'Goto implementation',
	})
	map:set('n', '<C-k>', vim.lsp.buf.signature_help, {
		desc = 'Show signature help',
	})

	--map:set('n', '<leader>wc', vim.lsp.buf.add_workspace_folder, {
	--	desc = 'Add workspace folder'
	--})
	--map:set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {
	--	desc = 'Remove workspace folder'
	--})

	map:set('n', '<leader>D', vim.lsp.buf.type_definition, {
		desc = 'Go to type definition',
	})
	map:set('n', '<leader>rr', vim.lsp.buf.rename, {
		desc = 'Rename',
	})
	--map:set('n', 'gr', function() vim.lsp.buf.references() and vim.cmd('copen') end, {
	--	desc =
	--})
	--map:set('n', '<leader>e', .lsp.diagnostic.show_line_diagnostics, {
	--	desc =
	--})
	map:set('n', '<leader>dp', vim.diagnostic.goto_prev, {
		desc = 'Previous diagnostic',
	})
	map:set('n', '<leader>dn', vim.diagnostic.goto_next, {
		desc = 'Next diagnostic',
	})
	map:set('n', '<leader>dl', vim.diagnostic.setloclist, {
		desc = '?',
	})
end

return M
