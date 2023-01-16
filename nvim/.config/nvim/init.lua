pcall(require, 'impatient')

require('my.general.disable_builtin')
require('my.utils.nvim.globals')

if not PREQUIRE('paq') then
	require('my.utils.paq').setup()
end
require('my.utils.paq.globals')
