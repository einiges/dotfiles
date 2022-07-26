
if pcall(require, 'impatient') then
	require('impatient').enable_profile()
end

require('my.general.disable_builtin')

require('my.general.options')
require('my.general.keymaps')
require('my.general.autocmds')

if not pcall(require, 'paq') then
	require('my.utils.paq.install').setup()
end

