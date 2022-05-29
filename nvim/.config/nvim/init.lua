
if pcall(require, 'impatient') then
	require('impatient').enable_profile()
end

vim.g.do_filetype_lua = 1    -- enable  lua filetype detection
vim.g.did_load_filetypes = 0 -- disable vim filetype detection

require('my.general.disable_builtin')

require('my.general.options')
require('my.general.keymaps')
require('my.general.autocmds')

if not pcall(require, 'paq') then
	require('my.utils.paq.install').setup()
end

