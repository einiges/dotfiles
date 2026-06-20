local M = {}
-- https://www.cssportal.com/css-cubic-bezier-generator/
-- https://easings.net/
local bezier = {
	easeInSine     = {{  0.12,  0   }, {  0.39,  0   }},
	easeInOutSine  = {{  0.61,  1   }, {  0.88,  1   }},
	easeOutSine    = {{  0.37,  0   }, {  0.63,  1   }},

	easeInQuad     = {{  0.11,  0   }, {  0.5,   0   }},
	easeOutQuad    = {{  0.5,   1   }, {  0.89,  1   }},
	easeInOutQuad  = {{  0.45,  0   }, {  0.55,  1   }},

	easeInCubic    = {{  0.32,  0   }, {  0.67,  0   }},
	easeOutCubic   = {{  0.33,  1   }, {  0.68,  1   }},
	easeInOutCubic = {{  0.65,  0   }, {  0.35,  1   }},

	easeInQuart    = {{  0.5,   0   }, {  0.75,  0   }},
	easeOutQuart   = {{  0.25,  1   }, {  0.5,   1   }},
	easeInOutQuart = {{  0.76,  0   }, {  0.24,  1   }},

	easeInQuint    = {{  0.64,  0   }, {  0.78,  0   }},
	easeOutQuint   = {{  0.22,  1   }, {  0.36,  1   }},
	easeInOutQuint = {{  0.83,  0   }, {  0.17,  1   }},

	easeInExpo     = {{  0.7,   0   }, {  0.84,  0   }},
	easeOutExpo    = {{  0.16,  1   }, {  0.3,   1   }},
	easeInOutExpo  = {{  0.87,  0   }, {  0.13,  1   }},

	easeInCirc     = {{  0.55,  0   }, {  1   ,  0.45}},
	easeOutCirc    = {{  0   ,  0.55}, {  0.45,  1   }},
	easeInOutCirc  = {{  0.85,  0   }, {  0.15,  1   }},

	easeInBack     = {{  0.36,  0   }, {  0.66, -0.56}},
	easeOutBack    = {{  0.34,  1.56}, {  0.64,  1   }},
	easeInOutBack  = {{  0.68, -0.6 }, {  0.32,  1.6 }},

	stable         = {{ 0, 0}, { 1,  1}},
	rapid          = {{ 0, 1}, { 0,  1}},
}

local init_curves = function ()
	for name, points in pairs(bezier) do
		hl.curve(name, {
			type = 'bezier',
			points = points,
		})
	end
end

local animate_floating = function ()
	hl.window_rule({
		match = {
			float = true,
		},
		animation = 'popin',
	})
end

M.apply = function ()
	init_curves()
	animate_floating()

	local animations = {
		windows     = {'slide', 'easeInOutCubic', 1},
		windowsIn   = {'slide', 'easeInOutCubic', 1},
		windowsOut  = {'slide', 'easeInOutCubic', 1},
		windowsMove = {'slide', 'easeInOutCubic', 1},
		border      = {nil,     'easeInOutCubic', 1},
		fade        = {nil,     'easeInOutCubic', 1},
		workspaces  = {'slide', 'easeInOutCubic', 1},
	}

	for leaf_name, animation in pairs(animations) do
		hl.animation({
			enabled = true,
			leaf    = leaf_name,
			style   = animation[1],
			bezier  = animation[2],
			speed   = animation[3],
		})
	end

end





return M
