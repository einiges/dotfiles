
" -- Vim Basic --

set autoindent
set completeopt=menuone,noinsert,noselect
set cursorline
set fillchars=eob:\ ,fold:─,
set foldmethod=indent
set foldminlines=5
set foldnestmax=2
set formatoptions=cjlnqrt
set hidden
set history=100
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:█\ ,extends:…,
set mouse=a
set number
set pastetoggle=<F10>
set relativenumber
set ruler
set scrolloff=5
set sidescroll=8
set shiftwidth=2
set showmatch
set showfulltag
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeout
set timeoutlen=300
set title
set ttimeout
set ttimeoutlen=15
set updatetime=250
set wildmenu
set wildmode=longest,list:full
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.out,*.class,*.hi
set wildignore+=*.swp,*.swo,*.swn
set wildignore+=*/.git,*/.hg,*/.svn
set wildignore+=tags,*.tags

set nofoldenable
set noshowmode
set nostartofline







let g:buftabline_plug_max = 0

let s:dein_cache = $XDG_CACHE_HOME . '/nvim/dein'
let s:dein_repo = s:dein_cache . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_cache)
	call mkdir(s:dein_repo, 'p')
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo
endif

exe 'set runtimepath+=' . s:dein_repo

if dein#load_state(s:dein_cache, expand('<sfile>'))

	call dein#begin(s:dein_cache)
	call dein#add('Shougo/dein.vim')

	" Colorschemes
	call dein#add('ntpeters/vim-better-whitespace')


	" Navigation
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('Shougo/denite.nvim', {'lazy': 1, 'on_cmd': 'Denite'})

	" Helper
	call dein#add('tpope/vim-fugitive')
	call dein#add('Shougo/neoinclude.vim')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('ludovicchabant/vim-gutentags')

	" Interface
	call dein#add('itchyny/lightline.vim')
	call dein#add('ap/vim-buftabline')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('kshenoy/vim-signature')

	" Deoplete
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/neco-vim', { 'on_ft': ['vim'] })
	call dein#add('zchee/deoplete-clang', { 'on_ft': ['c', 'cpp'] })
	call dein#add('zchee/deoplete-zsh', { 'on_ft': ['sh', 'zsh'] })
	call dein#add('Shougo/deoplete-clangx', { 'on_ft': ['c', 'cpp'] })

	" Support
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('Shougo/echodoc.vim')

	" Linter
	call dein#add('w0rp/ale')

	" Formatter
	call dein#add('rhysd/vim-clang-format', { 'on_ft': ['c', 'cpp', 'java', 'js', 'ts'] })
	call dein#add('kana/vim-operator-user')
	call dein#add('Chiel92/vim-autoformat')

	" Snippets
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')

	" Syntax
	call dein#add('justinmk/vim-syntax-extra') " C / C++
	call dein#add('kovetskiy/sxhkd-vim')
	call dein#add('ap/vim-css-color')


	call dein#end()
	call dein#save_state()
endif


" -- Plugin Settings --

filetype plugin indent on

" -- Colors --
syntax enable
colorscheme solarized_light


" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>


" vim-autoformat
noremap <F3> :Autoformat<CR>
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_completed_snippet = 1
let g:deoplete#max_menu_width = 100

" echodoc
call echodoc#enable()

" Lightline
let g:lightline = {
			\ 'colorscheme': 'solarized',
			\ }

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1


" Neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" ale
let g:ale_sign_error = 'ε'
let g:ale_sign_warning = 'ω'
"let g:ale_linters = { 'c': ['gcc']}
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
nmap <leader>en <Plug>(ale_next_wrap)
nmap <leader>er <Plug>(ale_previous_wrap)
nnoremap <leader>l :ALELint<Cr>
let g:ale_change_sign_column_color = 0
let g:ale_set_highlights = 0


" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '━'
let g:gitgutter_sign_modified_removed   = '╋'
let g:gitgutter_sign_removed_first_line = '▔'


" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist = [ 'help', 'tex' ]
let g:better_whitespace_enabled = 1
let g:better_whitespace_operator = ''


" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1



let g:tex_flavor = 'tex' " disable plaintex


" -- Commands --

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


" -- Mapping --

map <Space> <leader>
map <S-Space> <localleader>

inoremap <C-D> <Esc>
inoremap <C-D><C-D> <Esc>:

nnoremap ß <C-]>
nnoremap ẞ <C-T>

noremap Y y$
nnoremap <C-J> i<CR><Esc>k$

nnoremap q <Nop>


nnoremap X "_X
nnoremap <Backspace> "_X
nnoremap x "_x
nnoremap <Delete> "_x

nnoremap <Down> gj
nnoremap <Up> gk
noremap <Home> ^
inoremap <Home> <C-o>^
noremap <End> $

nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <S-Left>  <C-w><
nnoremap <S-Down>  <C-w>-
nnoremap <S-Up>    <C-w>+
nnoremap <S-Right> <C-w>>

" Indent without loosing visuality
xnoremap > >gv
xnoremap < <gv

" Search visual
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap /? y?\V<C-r>=escape(@",'/\')<CR><CR>

