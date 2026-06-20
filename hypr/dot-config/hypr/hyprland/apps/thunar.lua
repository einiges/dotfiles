
hl.window_rule({
	name = 'thunar-rename',
	match = {
		initial_class = [[[Tt]hunar]],
		initial_title = [[Rename .*]],
	},

	float        = true,
	size         = {'(monitor_w*0.5)', '(monitor_h*0.1)'},
	stay_focused = true,
})
