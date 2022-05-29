
local map = require('my.utils.nvim.keymap')()

vim.g.mapleader   = ' '
vim.g.maplocalleader = 'ü'

-- :h map-table

map:set('n', 'q', '<nop>')

--set('i', '<Left>', '<Esc>')
--set('i', '<Down>', '<Esc><Down>')
--set('i', '<Up>', '<Esc><Up>')
--set('i', '<Right>', '<Esc><Right>')
--set('i', '<Home>', '<Esc><Home>')
--set('i', '<End>', '<Esc><End>')
--
map:set('t', '<Esc><Esc>', '<C-\\><C-n>')
map:set('n', ',', ':')

map:set('n', 'ß', '<C-]>')
map:set('n', 'ẞ', '<C-T>')

-- Do not overwrite register
map:set('x', 'p'         , '"_dP')
map:set({ 'n', 'v' }, 'X'          , '"_X')
map:set({ 'n', 'v' }, '<Backspace>', '"_X')
map:set({ 'n', 'v' }, 'x'          , '"_x')
map:set({ 'n', 'v' }, '<Delete>'   , '"_x')

-- Jumplist mutations
map:expr()
:set('n', '<Up>'  , [[(v:count > 5 ? "m'" . v:count : "") . 'k']])
:set('n', '<Down>', [[(v:count > 5 ? "m'" . v:count : "") . 'j']])

map:set('n', '<Home>', '^')
map:set('i', '<Home>', '<C-o>^')

-- Window navigation
-- Focus
--map:set('n', '<C-Left>' , '<C-w>h')
--map:set('n', '<C-Down>' , '<C-w>j')
--map:set('n', '<C-Up>'   , '<C-w>k')
--map:set('n', '<C-Right>', '<C-w>l')

-- Move
map:set('n', '<C-S-Left>' , '<C-w>H')
map:set('n', '<C-S-Down>' , '<C-w>J')
map:set('n', '<C-S-Up>'   , '<C-w>K')
map:set('n', '<C-S-Right>', '<C-w>L')

-- Resize
--map:set('n', '<S-M-Down>', '<CMD>resize -2<CR>')
--map:set('n', '<S-M-Left>', '<CMD>vertical resize +8<CR>')
--map:set('n', '<S-M-Up>', '<CMD>resize +2<CR>')
--map:set('n', '<S-M-Right>', '<CMD>vertical resize -8<CR>')

-- Focus Buffer
map:set('n', '<PageUp>', '<CMD>bp<CR>')
map:set('n', '<PageDown>', '<CMD>bn<CR>')

-- Focus Tabs
map:set('n', '<S-PageUp>', '<CMD>tabprevious<CR>')
map:set('n', '<S-PageDown>', '<CMD>tabnext<CR>')

-- Move lines
map:set('x', '<S-Up>' , "<CMD>m '<-2<CR>gv=gv")
map:set('x', '<S-Down>', "<CMD>m '>+1<CR>gv=gv")
map:set('i', '<S-Up>' , '<CMD>m .-2<CR>')
map:set('i', '<S-Down>', '<CMD>m .+1<CR>')
map:set('n', '<S-Up>' , '<CMD>m .-2<CR>==')
map:set('n', '<S-Down>', '<CMD>m .+1<CR>==')

-- Additional Undo break points
map:set('i', ',', ',<C-g>u')
map:set('i', '.', '.<C-g>u')
--map:set('i', '!', '!<C-g>u')
--map:set('i', '?', '?<C-g>u')

-- Keeping it centered
map:set('n', 'n', 'nzzzv')
map:set('n', 'N', 'Nzzzv')

-- Cursor stays at position after joining lines
map:set('n', 'J', 'mzJ`z')

-- Split before cursor
map:set('n', '<C-j>', 'i<CR><Esc>')

-- Visual search
map:set('v', '*', [[y/\V<C-r>=escape(@",'/\')<CR><CR>]])
map:set('v', '?', [[y?\V<C-r>=escape(@",'/\')<CR><CR>]])

-- Stay VISUAL after indenting
map:set('x', '>', '>gv')
map:set('x', '<', '<gv')


