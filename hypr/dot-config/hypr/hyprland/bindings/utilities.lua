local M = {}

local screenshot = function ()
	local save_cmd = [[tee "$(xdg-user-dir PICTURES)/Screenshots/$(date --iso-8601=ns)"]]
	local sscc_fmt = ([[grim -g "%%s" - | %s | wl-copy]]):format(save_cmd)

	hl.bind('SUPER + s', function ()
		local region = H.window_region()
		hl.dispatch(hl.dsp.exec_cmd(sscc_fmt:format(region)))
	end)

	hl.bind('SUPER + SHIFT + s', hl.dsp.submap('screenshot'))

	hl.define_submap('screenshot', 'reset', function ()
		-- active window
		hl.bind('w', function ()
			local region = H.window_region()
			hl.dispatch(hl.dsp.exec_cmd(sscc_fmt:format(region)))
		end)

		hl.bind('s', function ()
			local region = H.workspace_region()
			hl.dispatch(hl.dsp.exec_cmd(sscc_fmt:format(region)))
		end)

		-- active monitor
		hl.bind('m', function ()
			local region = H.monitor_region()
			hl.dispatch(hl.dsp.exec_cmd(sscc_fmt:format(region)))
		end)

		-- area: free selection
		hl.bind('a', function ()
			hl.dispatch(hl.dsp.exec_cmd(sscc_fmt:format([[$(slurp -d)]])))
		end)

		-- everything
		hl.bind('e', hl.dsp.exec_cmd(
			([[grim - | %s | wl-copy]]):format(save_cmd)
		))

		hl.bind('escape', hl.dsp.submap('reset'))
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
