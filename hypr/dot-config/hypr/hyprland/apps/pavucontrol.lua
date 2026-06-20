
hl.window_rule({
	name = 'pavucontrol:size',
	match = {
		initial_class = [[.*\.pavucontrol]]
	}
	, float = true
	, size = {'(monitor_w*0.5)', '(monitor_h*0.5)'},
})

