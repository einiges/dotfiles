-- Enable Neovim's builtin spellchecker for buffers with tree-sitter
-- highlighting.
require('paq').register('lewis6991/spellsitter.nvim')

if not pcall(require, 'spellsitter') then
	return
end

require('spellsitter').setup()

