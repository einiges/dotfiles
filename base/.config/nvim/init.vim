
set runtimepath+=$XDG_CACHE_HOME/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('<sfile>'))

	call dein#begin(expand($XDG_CACHE_HOME.'/nvim/dein'))
	call dein#add('Shougo/dein.vim')

	"Colorschemes
	call dein#add('altercation/vim-colors-solarized')
	call dein#add('romainl/flattened')


	" Navigation
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('Shougo/denite.nvim')


	" Interface
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('airblade/vim-gitgutter')


	" Deoplete
	"call dein#add('Shougo/neco-vim',          { 'on_ft': ['vim'] })
	"call dein#add('tweekmonster/deoplete-clang2', { 'on_ft': ['c', 'cpp'] })
	"call dein#add('artur-shaik/vim-javacomplete2', { 'on_ft': ['java'] })


	"call dein#add('Quramy/tsuquyomi', {'lazy': 1 })


	" Helper
	call dein#add('tpope/vim-fugitive')
	call dein#add('w0rp/ale')
	call dein#add('Shougo/deoplete.nvim')
	"call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
	call dein#add('Shougo/neoinclude.vim')


	" Formatter
	"call dein#add('rhysd/vim-clang-format', { 'on_ft': ['c', 'cpp', 'java', 'js', 'ts'] })
	"call dein#add('kana/vim-operator-user')
	call dein#add('Chiel92/vim-autoformat')



	" Snippets
	call dein#add('SirVer/ultisnips')
	call dein#add('honza/vim-snippets')

	" Syntax
	call dein#add('justinmk/vim-syntax-extra')              " C / C++
	call dein#add('kovetskiy/sxhkd-vim')
	call dein#add('ap/vim-css-color', { 'if': '0' })


	call dein#end()
	call dein#save_state()
endif


" -- Plugin Settings --

filetype plugin indent on


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


" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '│'


" ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ale
let g:ale_sign_error = '∃'
let g:ale_sign_warning = 'ω'
let g:ale_linters = { 'c': ['gcc']}
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
nmap <leader>n <Plug>(ale_next_wrap)
nmap <leader>r <Plug>(ale_previous_wrap)



" -- Colors --
if $TERM =~ '\(st\|tmux\)-256color'
	colorscheme flattened_light
	set termguicolors
else
	colorscheme solarized
	set background=light
endif



" -- Vim Basics --

syntax enable
"set foldmethod=indent
"set foldlevel=0
"set foldnestmax=1
"set nofoldenable
set cursorline
"set cursorcolumn
"set lazyredraw
set number
set relativenumber
set timeoutlen=300
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
"set smarttab
"set shiftround
set ruler
set showmatch
set hidden
set history=100
set scrolloff=5
set sidescroll=8
set nostartofline
set splitbelow
set splitright

set ignorecase
set smartcase
set incsearch
"set nohlsearch
set pastetoggle=<F10>

",eol:¬
set listchars=tab:│\ ,precedes:◀,extends:▶,trail:█
set list

set title
set laststatus=2
set mouse=n

set wildmode=longest,list,full
set wildmenu
set completeopt+=noselect
set completeopt-=preview
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=tags,*.tags
set wildignore+=*.o,*.obj,*.hi,*.exe,*.dll,*.manifest,*.so,*.out,*.class,*.jpg,*jpeg,*.bmp,*.gif,*.png
set wildignore+=*.swp,*.swo,*.swn


let g:tex_flavor = 'tex' " disable plaintex


" -- Color Adjustments --

hi SpecialKey  cterm=NONE  ctermfg=12  gui=NONE  guifg=#C7D4D9  guibg=NONE
hi NonText     cterm=NONE  ctermfg=12  gui=NONE  guifg=#C7D4D9  guibg=NONE



" -- Commands --

command W w !sudo tee > /dev/null %


" -- Mapping --

map <Space> <leader>
map <localleader> <S-Space>

nnoremap <leader>l :ALELint<Cr>


noremap Y y$
nnoremap <C-J> i<CR><Esc>k$

nnoremap q <Nop>

nnoremap <silent> <Backspace> X
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
nnoremap <silent> <HOME> ^
nnoremap <silent> <END> $

nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <silent> <S-Left> <C-w><
nnoremap <silent> <S-Down> <C-w>-
nnoremap <silent> <S-Up>   <C-w>+
nnoremap <silent> <S-Right> <C-w>>


