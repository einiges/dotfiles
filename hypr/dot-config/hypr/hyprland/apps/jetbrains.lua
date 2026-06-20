


-- https://github.com/basecamp/omarchy/blob/dev/default/hypr/apps/jetbrains.conf

-- Fix splash screen showing in weird places and prevent annoying focus takeovers
hl.window_rule({
	name = 'jetbrains-splash',
	match = {
		class = [[^(jetbrains-.*)$]],
		title = [[^(splash)$]],
		float = true,
	},
	tag = '+jetbrains-splash',
	center = true,
	no_focus = true,
	border_size = 0,
})

-- Center popups/find windows
hl.window_rule({
	name = 'jetbrains-popup',
	match = {
		class = [[^(jetbrains-.*)]],
		title = [[^()$]],
		float = true,
	},
	tag = '+jetbrains',
	center = true,
	-- Enabling this makes it possible to provide input in popup dialogs (search window, new file, etc.)
	stay_focused = true,
	border_size = 0,
	min_size = {'(monitor_w*0.5)', '(monitor_h*0.5)'},
})

-- Disable window flicker when autocomplete or tooltips appear
hl.window_rule({
	name = 'jetbrains-tooltip',
	match = {
		class = [[^(jetbrains-.*)$]],
		title = [[^(win.*)$]],
		float = true,
	},
	no_initial_focus = true,
})

-- Disable mouse focus
hl.window_rule({
	name = 'jetbrains-focus',
	match = {
		class = [[^(jetbrains-.*)$]],
	},
	no_follow_mouse = true,
})



-- intellij
-- https://github.com/hyprwm/Hyprland/issues/3450
-- https://github.com/HyDE-Project/HyDE/issues/738
-- https://github.com/hyprwm/Hyprland/issues/9508
-- https://github.com/hyprwm/Hyprland/discussions/9866


-- Fix odd behaviors in IntelliJ IDEs --
-- Fix focus issues when dialogs are opened or closed
hl.window_rule({
	name = 'jetbrains-focus-float',
	match = {
		class = [[jetbrains-.*]],
		float = true,
	},

	focus_on_activate = true,
	stay_focused      = true,
})

-- Fix splash screen showing in weird places and prevent annoying focus takeovers
hl.window_rule({
	name = 'jetbrains-splashscreen',
	match = {
		class = [[jetbrains-.*]],
		title = [[splash]],
		float = true,
	},

	center      = true,
	no_focus    = true,
	border_size = 0,
})

-- Center popups/find windows
hl.window_rule({
	name = 'jetbrains-popups',
	match = {
		class = [[jetbrains-.*]],
		title = [[^( )$]],
		float = true,
	},

	center       = true,
	stay_focused = true,
	border_size  = 0,
})

-- Disable window flicker when autocomplete or tooltips appear
hl.window_rule({
	name = 'jetbrains-no-flicker',
	match = {
		class = [[jetbrains-.*]],
		title = [[win.*]],
		float = true,
	},

	no_focus = true,
})

