PAQ('mfussenegger/nvim-dap')

if not PREQUIRE('dap') then
	return
end

--
--
-- Signs
--
--
require('my.utils.nvim.sign').define('Dap', {
	Breakpoint = '●',
	BreakpointCondition = '●',
	LogPoint = '◒',
	Stopped = '→',
	BreakpointRejected = '○',
})


--
--
-- Keymaps
--
--


--
-- Steps
--
local has_hydra, Hydra = PREQUIRE('hydra')
if has_hydra then
	Hydra({
		name = 'DAP',
		mode = 'n',
		body = '<leader>d',
		heads = {
			{
				'n',
				function()
					require('dap').continue()
				end, {
					desc = 'Continue'
				}
			},
			{
				'r',
				function()
					require('dap').step_over()
				end, {
					desc = 'Step over'
				}
			},
			{
				'i',
				function()
					require('dap').step_into()
				end, {
					desc = 'Step into ↴'
				}
			},
			{
				'o',
				function()
					require('dap').step_out()
				end, {
					desc = 'Step out ↱'
				}
			},
			{
				'b',
				function()
					require('dap').step_back()
				end, {
					desc = 'Step back ↰'
				}
			},
		}
	})
end


vim.keymap.set('n', '<leader>dL',
	function()
		require('dap').run_last()
	end, {
		desc = 'Run last',
	}
)


vim.keymap.set('n', '<leader>dR',
	function()
		require('dap').restart()
	end, {
		desc = 'Restart',
	}
)


vim.keymap.set('n', '<leader>dT',
	function()
		require('dap').terminate()
	end, {
		desc = 'Terminate',
	}
)

--
-- Breakpont Setup
--

vim.keymap.set('n', 'db',
	function()
		require('dap').toggle_breakpoint()
	end,
	{
		desc = 'Breakpoint',
	}
)

vim.keymap.set('n', '<leader>dc',
	function()
		require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
	end, {
		desc = 'Conditional Breakpoint',
	}
)

vim.keymap.set('n', '<leader>dl',
	function()
		require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
	end, {
		desc = 'Logpoint',
	}
)

-- TODO: ?
vim.keymap.set('n', '<leader>dC',
	function()
		require('dap').repl.open()
	end, {
		desc = 'Debug-console',
	}
)
