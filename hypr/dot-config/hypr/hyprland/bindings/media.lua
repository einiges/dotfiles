local M = {}

M.apply = function ()
	-- audio:out
	hl.bind('XF86AudioMute'       , hl.dsp.exec_cmd([[wpctl set-mute   @DEFAULT_SINK@ toggle]]), { locked = true, repeating = true })
	hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd([[wpctl set-volume @DEFAULT_SINK@ 5%-]]),    { locked = true, repeating = true })
	hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd([[wpctl set-volume @DEFAULT_SINK@ 5%+]]),    { locked = true, repeating = true })

	-- audio:in
	hl.bind('XF86AudioMicMute'          , hl.dsp.exec_cmd([[wpctl set-mute   @DEFAULT_SOURCE@ toggle]]), { locked = true, repeating = true })
	hl.bind('ALT + XF86AudioMute'       , hl.dsp.exec_cmd([[wpctl set-mute   @DEFAULT_SOURCE@ toggle]]), { locked = true, repeating = true })
	hl.bind('ALT + XF86AudioLowerVolume', hl.dsp.exec_cmd([[wpctl set-volume @DEFAULT_SOURCE@ 5%-]]),    { locked = true, repeating = true })
	hl.bind('ALT + XF86AudioRaiseVolume', hl.dsp.exec_cmd([[wpctl set-volume @DEFAULT_SOURCE@ 5%+]]),    { locked = true, repeating = true })

	-- player control
	hl.bind('CTRL + XF86AudioRaiseVolume', hl.dsp.exec_cmd([[playerctl volume 0.05+]]), { repeating = true })
	hl.bind('CTRL + XF86AudioLowerVolume', hl.dsp.exec_cmd([[playerctl volume 0.05-]]), { repeating = true })

	hl.bind('XF86AudioPlay',  hl.dsp.exec_cmd([[playerctl play-pause]]), { locked = true })
	hl.bind('XF86AudioPause', hl.dsp.exec_cmd([[playerctl pause]]),      { locked = true })
	hl.bind('XF86AudioStop',  hl.dsp.exec_cmd([[playerctl stop]]),       { locked = true })
	hl.bind('XF86AudioPrev',  hl.dsp.exec_cmd([[playerctl previous]]),   { locked = true })
	hl.bind('XF86AudioNext',  hl.dsp.exec_cmd([[playerctl next]]),       { locked = true })

	hl.bind('SHIFT + XF86AudioPlay', hl.dsp.exec_cmd([[playerctl --all-players play]]),  { locked = true })
	hl.bind('SHIFT + XF86AudioStop', hl.dsp.exec_cmd([[playerctl --all-players pause]]), { locked = true })
	hl.bind('SHIFT + XF86AudioPrev', hl.dsp.exec_cmd([[playerctld shift]]),              { locked = true })
	hl.bind('SHIFT + XF86AudioNext', hl.dsp.exec_cmd([[playerctld unshift]]),            { locked = true })
end

return M
