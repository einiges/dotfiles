PAQ('rcarriga/nvim-dap-ui')
PAQ('theHamsta/nvim-dap-virtual-text')

if PREQUIRE('dapui') then
	return
end

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.after.event_terminated['dapui_config'] = dapui.close
dap.listeners.after.event_exited['dapui_config'] = dapui.close

