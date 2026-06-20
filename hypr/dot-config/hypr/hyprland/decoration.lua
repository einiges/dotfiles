local M = {}

local smart_gaps = function ()
	-- Smart gaps (ignoring special workspaces)previous_per_monitor
	hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
	hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
	hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
	hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
	hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
	hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })
end

M.apply = function ()
	local config = {}

	config.general = {
		border_size = 5,
		gaps_in     = { -5, 0, 0, -5 },
		gaps_out    = 0,

		col = {
			active_border = { angle = 90, colors = {
				"rgba(9d0006FF)",
				"rgba(9d0006FF)",
				"rgba(9d0006FF)",
				"rgba(FFFFFF60)",
			}},
			inactive_border = { colors = {
				"rgba(FFFFFF00)"
			}},
		},

		snap = {
			enabled = true,
		}
	}

	config.decoration = {
		rounding = 10,
		rounding_power = 3.0,

		shadow = {
			enabled = true,
			range   = 8,

			color          = "rgba(555555AA)",
			color_inactive = "rgba(555555AA)",

			offset         = { 1, 3 },
		}
	}

	config.dwindle = {
		force_split        = 2,
		preserve_split     = false,
		precise_mouse_move = true,
	}

	config.misc = {
		disable_hyprland_logo     = true,
		disable_splash_rendering  = true,
		force_default_wallpaper   = 2,
		on_focus_under_fullscreen = 1,

		mouse_move_enables_dpms   = true,
		key_press_enables_dpms    = true,

	}

	config.ecosystem = {
		no_update_news = true,
	}

	hl.config(config)
	smart_gaps()

	--hl.window_rule({
	--	match = {
	--		fullsceen_state = 1
	--	},
	--	rounding = 0,
	--	border_size = 2,
	--	opacity = "1.0 override"
	--})

end


return M
