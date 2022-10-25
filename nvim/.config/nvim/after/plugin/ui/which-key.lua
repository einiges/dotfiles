-- Show Keybindings with description
PAQ('folke/which-key.nvim')

if not PREQUIRE('which-key') then
	return
end

require('which-key').setup()

