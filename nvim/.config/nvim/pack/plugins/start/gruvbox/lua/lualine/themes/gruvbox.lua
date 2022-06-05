local T = {}

local colors = require('gruvbox.colors').palette()


T.normal = {
	a = {
		fg = colors.c0.l,
		bg = colors.c4.h,
		gui = 'bold',
	},
	b = {
		fg = colors.c4.h,
		bg = colors.c2.l,
	},
	c = {
		fg = colors.c4.h,
		bg = colors.c1.l,
	},
}

T.insert = {
	a = {
		fg = colors.c0.l,
		bg = colors.green.n,
		gui = 'bold',
	},
	b = {
		fg = colors.c4.h,
		bg = colors.c2.l,
	},
}

T.visual = {
	a = {
		fg = colors.c0.l,
		bg = colors.purple.n,
		gui = 'bold',
	},
	b = {
		fg = colors.c4.h,
		bg = colors.c2.l,
	},
}

T.replace = {
	a = {
		fg = colors.c0.l,
		bg = colors.red.n,
		gui = 'bold',
	},
	b = {
		fg = colors.c4.h,
		bg = colors.c2.l,
	},
}

T.command = {
	a = {
		fg = colors.c0.l,
		bg = colors.yellow.n,
		gui = 'bold',
	},
	b = {
		fg = colors.c4.h,
		bg = colors.c2.l,
	},
}

T.inactive = {
	a = {
		fg = colors.c0.l,
		bg = colors.c0.l,
		gui = 'bold',
	},
	b = {
		fg = colors.c0.l,
		bg = colors.c0.l,
	},
	c = {
		fg = colors.c0.l,
		bg = colors.c3.l,
	}
}

return T
