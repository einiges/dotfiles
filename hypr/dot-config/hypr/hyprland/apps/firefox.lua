
hl.window_rule({
	name = 'firefox:Save As',
	match = {
		--initial_class = [[xdg-desktop-portal-gtk]],
		initial_title = [[Save As - .* - Mozilla Firefox]],
		float            = true,
	},

	size         = {'(monitor_w*0.5)', ' (monitor_h*0.1)'},
	center = true
})
