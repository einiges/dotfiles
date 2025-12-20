
-- :h map-table

local map = vim.keymap.set

-- :h expr-quote
vim.g.mapleader = ' '
vim.g.maplocalleader = "\r"
--map('', ',', '<localleader>', { remap=true })

map('t', '<Esc><Esc>', '<C-\\><C-n>')

map('n', '<C-CR>', '<C-]>')
map('n', '<S-CR>', '<C-T>')

-- Keep register content
map('x'         , 'p'          , '"_dP')
map({ 'n', 'v' }, 'X'          , '"_X')
map({ 'n', 'v' }, '<Backspace>', '"_X')
map({ 'n', 'v' }, 'x'          , '"_x')
map({ 'n', 'v' }, '<Delete>'   , '"_x')

-- Jumplist mutations
map('n', '<Up>'  , [[(v:count > 5 ? "m'" . v:count : "") . 'k']], {
	expr = true,
})
map('n', '<Down>', [[(v:count > 5 ? "m'" . v:count : "") . 'j']], {
	expr = true,
})

map('n', '<Home>', '^')
map('i', '<Home>', '<C-o>^')

-- Focus Buffer
map('n', '<PageUp>', '<CMD>bp<CR>')
map('n', '<PageDown>', '<CMD>bn<CR>')

-- Focus Tabs
map('n', '<S-PageUp>', '<CMD>tabprevious<CR>')
map('n', '<S-PageDown>', '<CMD>tabnext<CR>')

-- Move lines
map('x', '<S-Up>' , [[:m '<-2<CR>gv=gv]])
map('x', '<S-Down>', [[:m '>+1<CR>gv=gv]])
map('i', '<S-Up>' , [[:m .-2<CR>]])
map('i', '<S-Down>', [[:m .+1<CR>]])
map('n', '<S-Up>' , [[:m .-2<CR>==]])
map('n', '<S-Down>', [[:m .+1<CR>==]])

-- Additional Undo break points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')

-- Keeping it centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Cursor stays at position after joining lines
map('n', 'J', 'mzJ`z')

-- Split before cursor
map('n', '<C-j>', 'i<CR><Esc>')

-- Visual search
map('x', '*', [[y/\V<C-r>=escape(@",'/\')<CR><CR>]])
map('x', '?', [[y?\V<C-r>=escape(@",'/\')<CR><CR>]])

-- Stay VISUAL after indenting
map('x', '>', '>gv')
map('x', '<', '<gv')

