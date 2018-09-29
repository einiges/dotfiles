
hi clear

if exists('syntax_on')
	syntax reset
endif

let colors_name = 'solarized_light'

hi Normal                                  ctermfg=12  ctermbg=8   guifg=#657b83  guibg=#fdf6e3  guisp=NONE

set background=light

hi ALEWarningSign                          cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi ALEErrorSign                            cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi BufTabLineActive                        cterm=NONE           ctermfg=4     ctermbg=0     guifg=#268bd2  guibg=#eee8d5  guisp=NONE     gui=NONE
hi ColorColumn                             cterm=NONE           ctermfg=NONE  ctermbg=0     guifg=NONE     guibg=#eee8d5  guisp=NONE     gui=NONE
hi Comment                                 cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi ConId                                   cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi Conceal                                 cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi Constant                                cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi Cursor                                  cterm=NONE           ctermfg=8     ctermbg=12    guifg=#fdf6e3  guibg=#657b83  guisp=NONE     gui=NONE
hi CursorColumn                            cterm=NONE           ctermfg=NONE  ctermbg=0     guifg=NONE     guibg=#eee8d5  guisp=NONE     gui=NONE
hi CursorLine                              cterm=NONE           ctermfg=NONE  ctermbg=0     guifg=NONE     guibg=#eee8d5  guisp=NONE     gui=NONE
hi CursorLineNr                            cterm=BOLD           ctermfg=4     ctermbg=0     guifg=#268bd2  guibg=#eee8d5  guisp=NONE     gui=BOLD
hi DiffAdd                                 cterm=NONE           ctermfg=2     ctermbg=0     guifg=#859900  guibg=#eee8d5  guisp=#859900  gui=NONE
hi DiffChange                              cterm=NONE           ctermfg=3     ctermbg=0     guifg=#b58900  guibg=#eee8d5  guisp=#b58900  gui=NONE
hi DiffDelete                              cterm=NONE           ctermfg=1     ctermbg=0     guifg=#dc322f  guibg=#eee8d5  guisp=NONE     gui=NONE
hi DiffText                                cterm=NONE           ctermfg=4     ctermbg=0     guifg=#268bd2  guibg=#eee8d5  guisp=#268bd2  gui=NONE
hi Directory                               cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi EndOfBuffer                             cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi Error                                   cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi ErrorMsg                                cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi ExtraWhitespace                         cterm=NONE           ctermfg=NONE  ctermbg=1     guifg=NONE     guibg=#dc322f  guisp=NONE     gui=NONE
hi FoldColumn                              cterm=NONE           ctermfg=12    ctermbg=0     guifg=#657b83  guibg=#eee8d5  guisp=NONE     gui=NONE
hi Folded                                  cterm=ITALIC         ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=ITALIC
hi HelpExample                             cterm=NONE           ctermfg=14    ctermbg=NONE  guifg=#586e75  guibg=NONE     guisp=NONE     gui=NONE
hi Identifier                              cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi IncSearch                               cterm=STANDOUT       ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=STANDOUT
hi LineNr                                  cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi MatchParen                              cterm=NONE           ctermfg=0     ctermbg=1     guifg=#FDF6E3  guibg=#dc322f  guisp=NONE     gui=NONE
hi ModeMsg                                 cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi MoreMsg                                 cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi NonText                                 cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi Pmenu                                   cterm=NONE           ctermfg=12    ctermbg=0     guifg=#657b83  guibg=#eee8d5  guisp=NONE     gui=NONE
hi PmenuSbar                               cterm=NONE           ctermfg=NONE  ctermbg=8     guifg=NONE     guibg=#fdf6e3  guisp=NONE     gui=NONE
hi PmenuSel                                cterm=NONE           ctermfg=8     ctermbg=4     guifg=#fdf6e3  guibg=#268bd2  guisp=NONE     gui=NONE
hi PmenuThumb                              cterm=NONE           ctermfg=NONE  ctermbg=0     guifg=NONE     guibg=#eee8d5  guisp=NONE     gui=NONE
hi PreProc                                 cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi Question                                cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi Search                                  cterm=NONE           ctermfg=8     ctermbg=3     guifg=#fdf6e3  guibg=#b58900  guisp=NONE     gui=NONE
hi SignColumn                              cterm=NONE           ctermfg=12    ctermbg=NONE  guifg=#657b83  guibg=NONE     guisp=NONE     gui=NONE
hi Special                                 cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi SpecialKey                              cterm=NONE           ctermfg=11    ctermbg=0     guifg=#839496  guibg=#eee8d5  guisp=NONE     gui=NONE
hi SpellBad                                cterm=UNDERCURL      ctermfg=NONE  ctermbg=NONE  guifg=NONE     guibg=NONE     guisp=#cb4b16  gui=UNDERCURL
hi SpellCap                                cterm=UNDERCURL      ctermfg=NONE  ctermbg=NONE  guifg=NONE     guibg=NONE     guisp=#6c71c4  gui=UNDERCURL
hi SpellLocal                              cterm=UNDERCURL      ctermfg=NONE  ctermbg=NONE  guifg=NONE     guibg=NONE     guisp=#b58900  gui=UNDERCURL
hi SpellRare                               cterm=UNDERCURL      ctermfg=NONE  ctermbg=NONE  guifg=NONE     guibg=NONE     guisp=#2aa198  gui=UNDERCURL
hi Statement                               cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi StatusLine                              cterm=NONE           ctermfg=0     ctermbg=14    guifg=#eee8d5  guibg=#586e75  guisp=NONE     gui=NONE
hi StatusLineNC                            cterm=NONE           ctermfg=0     ctermbg=11    guifg=#eee8d5  guibg=#839496  guisp=NONE     gui=NONE
hi TabLine                                 cterm=NONE           ctermfg=10    ctermbg=0     guifg=#93a1a1  guibg=#eee8d5  guisp=NONE     gui=NONE
hi TabLineFill                             cterm=NONE           ctermfg=10    ctermbg=0     guifg=#93a1a1  guibg=#eee8d5  guisp=NONE     gui=NONE
hi TabLineSel                              cterm=NONE           ctermfg=8     ctermbg=4     guifg=#fdf6e3  guibg=#268bd2  guisp=NONE     gui=NONE
hi Title                                   cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi Todo                                    cterm=NONE           ctermfg=5     ctermbg=NONE  guifg=#d33682  guibg=NONE     guisp=NONE     gui=NONE
hi Type                                    cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi UNDERLINEd                              cterm=NONE           ctermfg=13    ctermbg=NONE  guifg=#6c71c4  guibg=NONE     guisp=NONE     gui=NONE
hi VarId                                   cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi VertSplit                               cterm=NONE           ctermfg=0     ctermbg=0     guifg=#eee8d5  guibg=#eee8d5  guisp=NONE     gui=NONE
hi Visual                                  cterm=NONE           ctermfg=8     ctermbg=10    guifg=#fdf6e3  guibg=#93a1a1  guisp=NONE     gui=NONE
hi VisualNOS                               cterm=NONE           ctermfg=0     ctermbg=NONE  guifg=#eee8d5  guibg=NONE     guisp=NONE     gui=NONE
hi WarningMsg                              cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi WildMenu                                cterm=NONE           ctermfg=0     ctermbg=7     guifg=#eee8d5  guibg=#073642  guisp=NONE     gui=NONE
hi cPreCondit                              cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitBranch                         cterm=NONE           ctermfg=5     ctermbg=NONE  guifg=#d33682  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitComment                        cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitDiscardedFile                  cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitDiscardedType                  cterm=NONE           ctermfg=1     ctermbg=NONE  guifg=#dc322f  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitFile                           cterm=NONE           ctermfg=12    ctermbg=NONE  guifg=#657b83  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitHeader                         cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitOnBranch                       cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitSelectedFile                   cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitSelectedType                   cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitUnmerged                       cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitUnmergedFile                   cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi gitcommitUntrackedFile                  cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi GitGutterAdd                            cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi GitGutterChange                         cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi GitGutterDelete                         cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi GitGutterChangeDelete                   cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi helpHyperTextEntry                      cterm=NONE           ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=NONE
hi helpHyperTextJump                       cterm=UNDERLINE      ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=UNDERLINE
hi helpNote                                cterm=NONE           ctermfg=5     ctermbg=NONE  guifg=#d33682  guibg=NONE     guisp=NONE     gui=NONE
hi helpOption                              cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi helpVim                                 cterm=NONE           ctermfg=5     ctermbg=NONE  guifg=#d33682  guibg=NONE     guisp=NONE     gui=NONE
hi hsImport                                cterm=NONE           ctermfg=5     ctermbg=NONE  guifg=#d33682  guibg=NONE     guisp=NONE     gui=NONE
hi hsImportLabel                           cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hsModuleName                            cterm=UNDERLINE      ctermfg=2     ctermbg=NONE  guifg=#859900  guibg=NONE     guisp=NONE     gui=UNDERLINE
hi hsNiceOperator                          cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hsStatement                             cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hsString                                cterm=NONE           ctermfg=11    ctermbg=NONE  guifg=#839496  guibg=NONE     guisp=NONE     gui=NONE
hi hsStructure                             cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hsType                                  cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi hsTypedef                               cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hsVarSym                                cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi hs_DeclareFunction                      cterm=NONE           ctermfg=9     ctermbg=NONE  guifg=#cb4b16  guibg=NONE     guisp=NONE     gui=NONE
hi hs_OpFunctionName                       cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi hs_hlFunctionName                       cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi htmlArg                                 cterm=NONE           ctermfg=11    ctermbg=NONE  guifg=#839496  guibg=NONE     guisp=NONE     gui=NONE
hi htmlEndTag                              cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi htmlSpecialTagName                      cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi htmlTag                                 cterm=NONE           ctermfg=10    ctermbg=NONE  guifg=#93a1a1  guibg=NONE     guisp=NONE     gui=NONE
hi htmlTagN                                cterm=NONE           ctermfg=14    ctermbg=NONE  guifg=#586e75  guibg=NONE     guisp=NONE     gui=NONE
hi htmlTagName                             cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi javaScript                              cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi perlHereDoc                             cterm=NONE           ctermfg=14    ctermbg=NONE  guifg=#586e75  guibg=NONE     guisp=NONE     gui=NONE
hi perlStatementFileDesc                   cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi perlVarPlain                            cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi rubyDefine                              cterm=NONE           ctermfg=14    ctermbg=NONE  guifg=#586e75  guibg=NONE     guisp=NONE     gui=NONE
hi texMathMatcher                          cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi texMathZoneX                            cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi texRefLabel                             cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi texStatement                            cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi vimCmdSep                               cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi vimCommand                              cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi vimCommentString                        cterm=NONE           ctermfg=13    ctermbg=NONE  guifg=#6c71c4  guibg=NONE     guisp=NONE     gui=NONE
hi vimGroup                                cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi vimHiGroup                              cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi vimHiLink                               cterm=NONE           ctermfg=4     ctermbg=NONE  guifg=#268bd2  guibg=NONE     guisp=NONE     gui=NONE
hi vimIsCommand                            cterm=NONE           ctermfg=11    ctermbg=NONE  guifg=#839496  guibg=NONE     guisp=NONE     gui=NONE
hi vimSet                                  cterm=NONE           ctermfg=11    ctermbg=NONE  guifg=#657b83  guibg=NONE     guisp=NONE     gui=NONE
hi vimSetEqual                             cterm=NONE           ctermfg=11    ctermbg=NONE  guifg=#657b83  guibg=NONE     guisp=NONE     gui=NONE
hi vimSynMtchOpt                           cterm=NONE           ctermfg=3     ctermbg=NONE  guifg=#b58900  guibg=NONE     guisp=NONE     gui=NONE
hi vimSynType                              cterm=NONE           ctermfg=6     ctermbg=NONE  guifg=#2aa198  guibg=NONE     guisp=NONE     gui=NONE
hi Whitespace                              cterm=NONE           ctermfg=0     ctermbg=NONE  guifg=#eee8d5  guibg=NONE     guisp=NONE     gui=NONE

hi link Boolean                    Constant
hi link Character                  Constant
hi link Conditional                Statement
hi link Debug                      Special
hi link Define                     PreProc
hi link Delimiter                  Special
hi link Exception                  Statement
hi link Float                      Number
hi link Function                   Identifier
hi link HelpCommand                Statement
hi link Include                    PreProc
hi link Keyword                    Statement
hi link Label                      Statement
hi link Macro                      PreProc
hi link Number                     Constant
hi link Operator                   Statement
hi link PreCondit                  PreProc
hi link Repeat                     Statement
hi link SpecialChar                Special
hi link SpecialComment             Special
hi link StorageClass               Type
hi link String                     Constant
hi link Structure                  Type
hi link SyntasticError             SpellBad
hi link SyntasticErrorSign         Error
hi link SyntasticStyleErrorLine    SyntasticErrorLine
hi link SyntasticStyleErrorSign    SyntasticErrorSign
hi link SyntasticStyleWarningLine  SyntasticWarningLine
hi link SyntasticStyleWarningSign  SyntasticWarningSign
hi link SyntasticWarning           SpellCap
hi link SyntasticWarningSign       Todo
hi link Tag                        Special
hi link Typedef                    Type

hi link diffAdded                  Statement
hi link diffBDiffer                WarningMsg
hi link diffCommon                 WarningMsg
hi link diffDiffer                 WarningMsg
hi link diffIdentical              WarningMsg
hi link diffIsA                    WarningMsg
hi link diffLine                   Identifier
hi link diffNoEOL                  WarningMsg
hi link diffOnly                   WarningMsg
hi link diffRemoved                WarningMsg

hi link gitcommitDiscarded         gitcommitComment
hi link gitcommitDiscardedArrow    gitcommitDiscardedFile
hi link gitcommitNoBranch          gitcommitBranch
hi link gitcommitSelected          gitcommitComment
hi link gitcommitSelectedArrow     gitcommitSelectedFile
hi link gitcommitUnmergedArrow     gitcommitUnmergedFile
hi link gitcommitUntracked         gitcommitComment

hi link helpSpecial                Special

hi link hsDelimTypeExport          Delimiter
hi link hsImportParams             Delimiter
hi link hsModuleStartLabel         hsStructure
hi link hsModuleWhereLabel         hsModuleStartLabel
hi link htmlLink                   Function

hi link lCursor                    Cursor

hi link vimFunc                    Function
hi link vimUserFunc                Function
hi link vipmVar                    Identifier

hi clear SyntasticErrorLine
hi clear SyntasticWarningLine
hi clear helpLeadBlank
hi clear helpNormal

if has('nvim')
	let g:terminal_color_0  = '#eee8d5'
	let g:terminal_color_1  = '#dc322f'
	let g:terminal_color_2  = '#859900'
	let g:terminal_color_3  = '#b58900'
	let g:terminal_color_4  = '#268bd2'
	let g:terminal_color_5  = '#d33682'
	let g:terminal_color_6  = '#2aa198'
	let g:terminal_color_7  = '#073642'
	let g:terminal_color_8  = '#fdf6e3'
	let g:terminal_color_9  = '#cb4b16'
	let g:terminal_color_10 = '#93a1a1'
	let g:terminal_color_11 = '#839496'
	let g:terminal_color_12 = '#657b83'
	let g:terminal_color_13 = '#6c71c4'
	let g:terminal_color_14 = '#586e75'
	let g:terminal_color_15 = '#002b36'
endif
