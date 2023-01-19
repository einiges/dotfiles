local T = {}

local colors = require('my-gruvbox.colors').palette()
local helper = require('my-gruvbox.theme').helper(colors)


T.normal = {
	a = {
		fg = helper.ui2.fg,
		bg = helper.ui2.bg,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
	c = {
		fg = helper.ui.fg,
		bg = helper.ui.bg,
	},
}

T.insert = {
	a = {
		fg = helper.ui2.fg,
		bg = colors.green.n,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
}

T.visual = {
	a = {
		fg = helper.ui2.fg,
		bg = colors.purple.n,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
}

T.replace = {
	a = {
		fg = helper.ui2.fg,
		bg = colors.red.n,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
}

T.command = {
	a = {
		fg = helper.ui2.fg,
		bg = colors.yellow.n,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
}

T.inactive = {
	a = {
		fg = helper.ui2.fg,
		bg = helper.ui2.bg,
		gui = 'bold',
	},
	b = {
		fg = helper.ui1.fg,
		bg = helper.ui1.bg,
	},
	c = {
		fg = helper.ui.fg,
		bg = helper.ui.bg,
	}
}

return T
