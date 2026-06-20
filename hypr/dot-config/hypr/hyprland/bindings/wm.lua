local M = {}

local gamemode = function ()
	if hl.get_config('animations.enabled') then
		hl.config({
			general = {
				gaps_in  = 0,
				gaps_out = 0,
				border_size = 1,
			},
			animations = {
				enabled = false,
			},
			decoration = {
				rounding = 0,
				fullscreen_opacity = 1,
				blur = {
					enabled = false,
				},
				shadow = {
					enabled = false,
				},
			}
		})
	else
		hl.dispatch(hl.dsp.exec_cmd('hyprctl reload'))
	end
end

M.apply = function ()
	hl.bind('SUPER + F5', hl.dsp.exec_cmd('hyprctl reload'))
	hl.bind('SUPER + F1', gamemode)

	-- WINDOW OPERATIONS

	hl.bind('SUPER + x',         hl.dsp.window.close('activewindow'))
	hl.bind('SUPER + SHIFT + x', hl.dsp.window.kill('activewindow'))

	hl.bind('SUPER         + f', hl.dsp.window.fullscreen({mode = 'maximized'}))
	hl.bind('SUPER + SHIFT + f', hl.dsp.window.fullscreen({mode = 'fullscreen'}))
	hl.bind('SUPER + CTRL  + f', function ()
		hl.dispatch(hl.dsp.window.float({action = 'toggle'}))
		hl.dispatch(hl.dsp.window.center())
	end)

	hl.bind('SUPER + SHIFT + space', hl.dsp.window.center())

	hl.bind('SUPER + p', hl.dsp.window.pin())


	-- focus window
	hl.bind('SUPER + n', hl.dsp.focus({direction = 'left'}))
	hl.bind('SUPER + r', hl.dsp.focus({direction = 'down'}))
	hl.bind('SUPER + t', hl.dsp.focus({direction = 'up'}))
	hl.bind('SUPER + d', hl.dsp.focus({direction = 'right'}))


	hl.bind('SUPER + space', hl.dsp.focus({urgent_or_last = true}))
	hl.bind('SUPER + tab', function ()
		hl.dispatch(hl.dsp.window.cycle_next({next = true}))
		hl.dispatch(hl.dsp.window.alter_zorder({mode = 'top'}))
	end)
	hl.bind('SUPER + SHIFT + tab', function ()
		hl.dispatch(hl.dsp.window.cycle_next({next = false}))
		hl.dispatch(hl.dsp.window.alter_zorder({mode = 'top'}))
	end)


	-- position windows
	hl.bind('SUPER + SHIFT + n', function ()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.swap({direction = 'left'}))
		else
			hl.dispatch(hl.dsp.window.move({x = -250, y = 0, relative = true}))
		end
	end)

	hl.bind('SUPER + SHIFT + r', function ()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.swap({direction = 'down'}))
		else
			hl.dispatch(hl.dsp.window.move({x = 0, y = 100, relative = true}))
		end
	end)

	hl.bind('SUPER + SHIFT + t', function ()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.swap({direction = 'up'}))
		else
			hl.dispatch(hl.dsp.window.move({x = 0, y = -100, relative = true}))
		end
	end)

	hl.bind('SUPER + SHIFT + d', function ()
		if not hl.get_active_window().floating then
			hl.dispatch(hl.dsp.window.swap({direction = 'right'}))
		else
			hl.dispatch(hl.dsp.window.move({x = 250, y = 0, relative = true}))
		end
	end)


	hl.bind('SUPER + ALT + n', hl.dsp.window.move({direction = 'left'}))
	hl.bind('SUPER + ALT + r', hl.dsp.window.move({direction = 'down'}))
	hl.bind('SUPER + ALT + t', hl.dsp.window.move({direction = 'up'}))
	hl.bind('SUPER + ALT + d', hl.dsp.window.move({direction = 'right'}))


	-- resize window
	local resizing = {
		n = {x = -200, y =    0},
		r = {x =    0, y =  200},
		t = {x =    0, y = -200},
		d = {x =  200, y =    0},
	}

	for key, ori in pairs(resizing) do
		hl.bind('SUPER + CTRL + ' .. key, hl.dsp.window.resize({
			x = ori.x,
			y = ori.y,
			relative = true,
		}), { repeating = true })
	end



	-- layout
	hl.bind('SUPER + MOD5 + n', hl.dsp.layout('preselect l'))
	hl.bind('SUPER + MOD5 + r', hl.dsp.layout('preselect d'))
	hl.bind('SUPER + MOD5 + t', hl.dsp.layout('preselect u'))
	hl.bind('SUPER + MOD5 + d', hl.dsp.layout('preselect r'))
	hl.bind('SUPER + MOD5 + space', hl.dsp.layout('togglesplit'))
	hl.bind('SUPER + MOD5 + f', hl.dsp.layout('movetoroot'))

	local workspaces = {
		[1] = 'name:1',
		[2] = '2',
		[3] = '3',
		[4] = '4',
		[5] = '5',
		[6] = '6',
		[7] = '7',
		[8] = '8',
		[9] = '9',
		[0] = '10',
		dead_circumflex = 'previous'
	}

	-- focus workspace
	for key, workspace in pairs(workspaces) do
		hl.bind('SUPER + ' .. key, hl.dsp.focus({
			workspace = workspace,
			on_current_monitor = true
		}))
	end

	hl.bind('SUPER + minus', hl.dsp.workspace.toggle_special('special'))

	hl.bind('SUPER + dead_circumflex', hl.dsp.focus({workspace = 'previous', on_current_monitor = true}))


	-- move to workspace
	for key, workspace in pairs(workspaces) do
		hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move({
			workspace = workspace,
			follow = false,
			window = 'activewindow',
		}))
	end


	--
	hl.bind('SUPER         + h', hl.dsp.focus({monitor = '-1'}))
	hl.bind('SUPER         + g', hl.dsp.focus({monitor = '+1'}))
	hl.bind('SUPER + SHIFT + h', hl.dsp.window.move({monitor = '-1', follow = false}))
	hl.bind('SUPER + SHIFT + g', hl.dsp.window.move({monitor = '+1', follow = false}))
	hl.bind('SUPER + CTRL  + h', hl.dsp.workspace.swap_monitors({ monitor1 = 'current', monitor2 = '-1'}))
	hl.bind('SUPER + CTRL  + g', hl.dsp.workspace.swap_monitors({ monitor1 = 'current', monitor2 = '+1'}))

	--
	hl.bind('SUPER + b', hl.dsp.exec_cmd([[systemctl --user kill --signal=SIGUSR1 waybar]]), {release = true})


	-- MOUSE BINDINGS

	hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })
	hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })
	hl.bind('SUPER + mouse:275', hl.dsp.window.float('toggle', 'activewindow'))
	hl.bind('SUPER + mouse:274', hl.dsp.window.close('activewindow'))

	hl.bind('SUPER + mouse_down', hl.dsp.focus({workspace = 'e+1', on_current_monitor = true}))
	hl.bind('SUPER + mouse_up',   hl.dsp.focus({workspace = 'e-1', on_current_monitor = true}))
	
end

return M
