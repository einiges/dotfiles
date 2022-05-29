
local opt = vim.opt

opt.textwidth = 80
opt.colorcolumn = { '+1', '+2', '+3', '+41', '+42', '+81' }

opt.belloff = 'all'

opt.autoread = true
opt.completeopt = {
	'menu',
	'menuone',
	'noinsert',
	'noselect',
}
opt.copyindent = true
opt.formatoptions = 'crnlqjp'
opt.hidden = true
opt.history = 100
opt.laststatus = 3
opt.lazyredraw = true

opt.list = true
opt.listchars:append {
	--tab      = '╶─→',
	tab      = '  ',
	nbsp     = '⍽',
	trail    = '░',
	--multispace = '╾───',

	-- Pilcrow: ¶ (u01b6)
	-- ↵
	--eol      = '¬',
	extends  = '…',
	precedes = '…',
}

opt.fillchars:append {
	eob       = ' ',

	fold      = '–',
	-- foldopen  = ' ',
	-- foldclose = ' ',
	-- ⮧⮦
}
opt.foldenable   = false
opt.foldmethod   = 'indent'
opt.foldminlines = 5
opt.foldnestmax  = 2
opt.showmode     = false
opt.startofline  = false

opt.cursorline     = true
opt.cursorcolumn   = false
opt.numberwidth    = 6
opt.number         = true
opt.relativenumber = true
opt.ruler          = true

opt.mouse      = 'a'
opt.scrolloff  = 5
opt.sidescroll = 8

opt.ignorecase  = true
opt.incsearch   = true
opt.showmatch   = true
opt.signcolumn  = 'auto:1-4'
opt.smartcase   = true

opt.smartindent = true
opt.tabstop     = 4
opt.shiftwidth  = 0 -- 0 -> 'tabstop'
opt.softtabstop = -1 -- <0 -> 'shiftwidth'

opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.breakindent = true
opt.showbreak = string.rep(' ', 3)
opt.linebreak = true

opt.splitbelow  = true
opt.splitright  = true
opt.timeout     = true
opt.timeoutlen  = 800
opt.ttimeout    = true
opt.ttimeoutlen = 15
-- opt.updatetime  = 250
opt.wildmenu    = true
opt.wildoptions = 'pum'
opt.wildmode    = {
	'longest',
	'full',
}

vim.api.nvim_command('set wildcharm=<Tab>')

opt.wildignorecase = true
opt.wildignore:append {
	'*.jpg', '*.jpeg', '*.bmp', '*.gif', '*.png',

	'*.o', '*.so',
	'*.out', '*.class', '*.hi',

	'*.swp', '*.swo', '*.swn',
	'tags', '*.tags',
}


-- TODO: Set only of supports truecolors
opt.background='light'
vim.api.nvim_cmd({
	cmd = 'colorscheme',
	args = { 'gruvbox' }
}, {})

-- TODO: infocmp Tc
opt.termguicolors = true
opt.syntax = 'enable'


