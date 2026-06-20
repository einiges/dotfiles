hl.window_rule({
	match = {
		initial_class = [[steam_app_\d+]],
		float = true
	},
	rounding = 0,
})

hl.window_rule({
	match = {
		initial_class = [[steam_app_\d+]],
	},
	content = 'game',
})

hl.window_rule({
	name = 'steam:splash-signin',
		match = {
		initial_class = [[steam]],
		initial_title = [[Sign in to Steam]],
	},

	float            = true,
	no_initial_focus = true,
	-- TODO:
	--move = $window_dock_right $window_dock_down
	move = H.window_rule_dock('right', 'down')
})

hl.window_rule({
	name = 'steam:friends-list',
	match = {
		initial_class = [[steam]],
		initial_title = [[Friends List]],
	},

	float = true,
	size  = {'(monitor_w*0.4)', '(monitor_h*0.7)'},
	-- TODO:
	--move  = $window_dock_right $window_dock_down
	move = H.window_rule_dock('right', 'down')
})

hl.window_rule({
	name = 'steam:float',
	match = {
		initial_class = [[steam]],
		initial_title = [[Steam]],
		float         = true,
	},

	-- TODO:
	--move  = $window_dock_right $window_dock_down
	move = H.window_rule_dock('right', 'down')
})

hl.window_rule({
	name = 'steam:steam-app',
	match = {
		initial_class = [[steam_app_\d+]],
		float         = true,
	},

	-- TODO:
	--move = $window_dock_right $window_dock_down
	move = H.window_rule_dock('right', 'down')
})
