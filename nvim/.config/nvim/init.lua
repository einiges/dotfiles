if pcall(require, 'impatient') then
	require('impatient').enable_profile()
end

require('my.general.disable_builtin')
require('my.utils.nvim.globals')

require('my.general.options')
require('my.general.keymaps')
require('my.general.autocmds')

if not PREQUIRE('paq') then
	require('my.utils.paq').setup()
end
require('my.utils.paq.globals')
