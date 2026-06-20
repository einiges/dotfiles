local M = {}

-- F13: XF86Tools
-- F14: XF86Launch5
-- F15: XF86Launch6
-- F16: XF86Launch7
-- F17: XF86Launch8
-- F18: XF86Launch9
-- F19: NoSymbol
-- F20: XF86AudioMicMute
-- F21: XF86TouchPadToggle
-- F22: XF86TouchPadOn
-- F23: XF86TouchPadOff
-- F24: NoSymbol

M.apply = function ()
	require('hyprland.bindings.wm').apply()
	require('hyprland.bindings.utilities').apply()
	require('hyprland.bindings.media').apply()
end

return M
