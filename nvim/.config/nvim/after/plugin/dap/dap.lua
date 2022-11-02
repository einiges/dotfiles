PAQ('mfussenegger/nvim-dap')

if not PREQUIRE('dap') then
	return
end

--
--
-- Signs
--
--
local signs = {
	Breakpoint = ' ',
	BreakpointCondition = '',
	LogPoint = ' ',
	Stopped = ' ',
	BreakpointRejected = '',
}

for type, icon in pairs(signs) do
	local name = 'Dap' .. type
	-- TODO: Define Colors, probably dont want texthl=numhl=linehl and especially culhl=name
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name, linehl = name, culhl = name })
end

--
--
-- Keymaps
--
--
local nmap = require('my.utils.nvim.keymap')():mode('n')

nmap:desc('Continue'):setX('<F5>', function()
	require('dap').continue()
end)

nmap:desc('Step over'):setX('<F6>', function()
	require('dap').step_over()
end)

nmap:desc('Step into'):setX('<F7>', function()
	require('dap').step_into()
end)
nmap:desc('Step out'):setX('<F8>', function()
	require('dap').step_out()
end)
nmap:desc('Step back'):setX('<F4>', function()
	require('dap').step_back()
end)
nmap:desc('Toggle breakpoint'):setX('<leader>b', function()
	require('dap').toggle_breakpoint()
end)
nmap:desc('Set conditional breakpoint'):setX('<leader>B', function()
	require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nmap:desc(''):setX('<leader>lp', function()
	require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
nmap:desc('Open'):setX('<leader>dr', function()
	require('dap').repl.open()
end)
nmap:desc('Run last'):setX('<leader>dl', function()
	require('dap').run_last()
end)
