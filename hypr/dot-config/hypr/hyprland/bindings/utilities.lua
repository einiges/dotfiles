local M = {}

local screenshot = function ()
	hl.bind('SUPER + SHIFT + s', hl.dsp.submap('screenshot'))

	-- TODO: Add functionality to delay taking the screenshot
	-- TODO: Add functionality to open taken screenshot in an editor
	-- TODO: Add functionality to save screenshot to storage and clipboard
	hl.define_submap('screenshot', 'reset', function ()
		local scrn    = [[grim -g -]]
		local scrncpy = [[grim -g - - | wl-copy]]

		--hl.bind('l/o', rofi show screenshots, open in editor)

		-- active window
		local active_window_geometry_cmd = [[hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"']]
		hl.bind('w',        hl.dsp.exec_cmd(active_window_geometry_cmd .. '|' .. scrn))
		hl.bind('SHIFT + w',hl.dsp.exec_cmd(active_window_geometry_cmd .. '|' .. scrncpy))

		-- active workspace - like monitor, excluding reserved area
		local active_workspace_geomentry_cmd = [[hyprctl monitors -j | jq -r --arg monitor "$(hyprctl activeworkspace -j | jq -r '.monitor')" 'map(select(.name == $monitor) | "\(.x + .reserved[0]),\(.y + .reserved[1]) \(.width - .reserved[0] - .reserved[2])x\(.height - .reserved[1] - .reserved[3])") | first']]
		hl.bind('s',         hl.dsp.exec_cmd(active_workspace_geomentry_cmd .. '|' .. scrn))
		hl.bind('SHIFT + S', hl.dsp.exec_cmd(active_workspace_geomentry_cmd .. '|' .. scrncpy))

		-- active monitor
		local active_monitor_geomentry_cmd = [[hyprctl monitors -j | jq -r --arg monitor "$(hyprctl activeworkspace -j | jq -r '.monitor')" 'map(select(.name == $monitor) | "\(.x),\(.y) \(.width)x\(.height)") | first']]
		hl.bind('m',         hl.dsp.exec_cmd(active_monitor_geomentry_cmd .. '|' .. scrn))
		hl.bind('SHIFT + m', hl.dsp.exec_cmd(active_monitor_geomentry_cmd .. '|' .. scrncpy))

		-- area: free selection
		local area_selection_geomentry_cmd = 'slurp -d'
		hl.bind('a',         hl.dsp.exec_cmd(area_selection_geomentry_cmd .. '|' .. scrn))
		hl.bind('SHIFT + a', hl.dsp.exec_cmd(area_selection_geomentry_cmd .. '|' .. scrncpy))

		-- everything
		hl.bind('e',         hl.dsp.exec_cmd([[grim]]))
		hl.bind('SHIFT + E', hl.dsp.exec_cmd([[grim | wl-copy]]))

		hl.bind('catchall', hl.dsp.submap('reset'))
	end)
end

local system = function ()
	-- monitor brightness control
	hl.bind('SHIFT + XF86MonBrightnessDown', hl.dsp.exec_cmd([[brightnessctl --quiet set    0%]]),  { locked = true, repeating = true })
	hl.bind('XF86MonBrightnessDown',         hl.dsp.exec_cmd([[brightnessctl --quiet set   10%-]]), { locked = true, repeating = true })
	hl.bind('XF86MonBrightnessUp',           hl.dsp.exec_cmd([[brightnessctl --quiet set  +10%]]),  { locked = true, repeating = true })
	hl.bind('SHIFT + XF86MonBrightnessUp',   hl.dsp.exec_cmd([[brightnessctl --quiet set  100%]]),  { locked = true, repeating = true })

	-- SYSTEM
	local logout      = [[loginctl terminate-user '']]
	local lockSession = [[loginctl lock-session]]

	hl.bind('SUPER       + l', hl.dsp.exec_cmd(lockSession))
end

local launchers = function ()
	-- SYSTEM POWER MENU
	hl.bind('SUPER + SHIFT + L', hl.dsp.exec_cmd([[rofi -show-icons -show drun -drun-categories 'UserSession,SystemPower']]))


	-- PROGRAM LAUNCHER
	hl.bind('SUPER + SUPER_L',
		hl.dsp.exec_cmd([[pkill rofi || rofi -show-icons -show drun -drun-exclude-categories 'UserSession,SystemPower']]), {
			release = true,
		})

	--

	hl.bind('SUPER + SHIFT + Shift_L', hl.dsp.submap('menuexec'))

	hl.define_submap('menuexec', 'reset', function ()
		-- man (1,5)
		hl.bind('m', hl.dsp.exec_cmd([[man --apropos --sections='1,5' . | cut --delimiter=' ' --fields=1 | rofi -dmenu | xargs --no-run-if-empty $terminal man]]), {
			release = true,
		})
		hl.bind('n', hl.dsp.exec_cmd([[man --apropos                  . | cut --delimiter=' ' --fields=1 | rofi -dmenu | xargs --no-run-if-empty $terminal man]]), {
			release = true,
		})

		-- passmenu
		hl.bind('p', hl.dsp.exec_cmd('passmenu-rofi'))

		hl.bind('catchall', hl.dsp.submap('reset'))
	end)
end

M.apply = function ()
	local terminal = 'kitty --single-instance'

	-- QUICK LAUNCH
	hl.bind('SUPER + Return', hl.dsp.exec_cmd('exec ' .. terminal))
	hl.bind('SUPER + e', hl.dsp.exec_cmd('thunar'))
	hl.bind('SUPER + a', hl.dsp.exec_cmd('browser'))
	hl.bind('SUPER + v', hl.dsp.exec_cmd('pavucontrol'))

	launchers()
	screenshot()
	system()

end

return M
