local M = {}

local set_keyboard_layout = function ()
	hl.config({
		input = {
			kb_layout = "de,th,de",
			kb_variant = "neo,pat,nodeadkeys",
			kb_model = "",
			kb_options = "grp:ctrls_toggle",
			kb_rules = "",
		}
	})
end


M.apply = function ()

	set_keyboard_layout()

	local config = {}
	config.input = {
		follow_mouse = 1,

		focus_on_close = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	}

	config.misc = {
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
	}

	hl.config(config)
end

return M
