--vim.opt_local.title = false
vim.opt_local.formatoptions = 'acnqtw'
vim.opt_local.spell = true
vim.opt_local.spelllang = 'de,en'
vim.opt_local.listchars:append {
	eol = '¬',
}
vim.opt_local.joinspaces = false
vim.opt_local.smartindent = false
vim.opt_local.textwidth = 72

-- Remove Signatures from plain mails
--command! SigAllClean   :%s/\(^ *>[> ]*\)-- \n\%(\1[^>\n]*$\|\n\)*
--command! SigAllStrict  :%s/\(^ *>[> ]*\)-- \n\%(\1.*$\|\n\)*
--command! SigLastClean  :%s/\(^ *> *\)-- \n\%(\1[^>\n]*$\|\n\)*
--command! SigLastStrict :%s/\(^ *> *\)-- \n\%(\1.*$\|\n\)*

