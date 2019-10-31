setlocal notitle
setlocal formatoptions=acnqtw
setlocal spell
setlocal spelllang=de_de,en
setlocal listchars+=eol:¬
setlocal nojoinspaces
setlocal nosmartindent
setlocal textwidth=72

" Remove Signatures from plain mails
command! SigAllClean   :%s/\(^ *>[> ]*\)-- \n\%(\1[^>\n]*$\|\n\)*
command! SigAllStrict  :%s/\(^ *>[> ]*\)-- \n\%(\1.*$\|\n\)*
command! SigLastClean  :%s/\(^ *> *\)-- \n\%(\1[^>\n]*$\|\n\)*
command! SigLastStrict :%s/\(^ *> *\)-- \n\%(\1.*$\|\n\)*

hi ExtraWhitespace                         cterm=NONE           ctermfg=NONE  ctermbg=0     guifg=NONE     guibg=#eee8d5  guisp=NONE     gui=NONE
