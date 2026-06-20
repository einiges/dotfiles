local M = {}

local no_idle = function ()
	local matchers = {
		{ class = [[.*]], },
		{ title = [[.*]], },
		{ fullscreen = true, },
	}
	for _, matcher in ipairs(matchers) do
		hl.window_rule({
			match = matcher,
			idle_inhibit = 'fullscreen',
		})
	end
end

local media = function ()
	local cmatchers = {
		video = {
			{ initial_class = [[mpv]], },
			{ title = [[.* - Twitch — .*]], },
		},
	}

	for content, matchers in pairs(cmatchers) do
		for _, matcher in ipairs(matchers) do
			hl.window_rule({
				match = matcher,
				content = content,
			})
		end
	end
end

local no_dim = function ()
	local matchers = {
		{ content = 'video', },
		{ content = 'game', },
		{ fullscreen_state_client = 2 },
		{ fullscreen_state_internal = 2 },
	}
	for _, matcher in ipairs(matchers) do
		hl.window_rule({
			match = matcher,
			no_dim = true,
		})
	end
end

local no_transparency = function ()
	local matchers = {
		{ content = 'video' },
		{ content = 'game' },
	}

	for _, matcher in ipairs(matchers) do
		hl.window_rule({
			match = matcher,
			opacity = '1 override',
		})
	end
end


local redirect = function ()
	hl.window_rule({
		match = {
			initial_class = [[firefox]],
		},
		workspace = '1 silent',
	})

	hl.window_rule({
		match = {
			initial_class = [[Eclipse]],
		},
		workspace = '2 silent',
	})

	hl.window_rule({
		match = {
			initial_class = [[Signal|Teamspeak 3|discord]],
		},
		workspace = '8 silent',
	})
	hl.window_rule({
		match = {
			initial_class = [[Mutt]],
		},
		workspace = '9 silent',
	})

	hl.window_rule({
		match = {
			xdg_tag = [[ncmpcpp|calcurse|newsboat]],
		},
		workspace = '10 silent',
	})
end


-- Secrets
local no_share = function ()
	hl.window_rule({
		name = 'secrets-input',
		match = {
			class = [[.*([Aa]uth|[Pp]ass|[Pp]in).*]]
		},

		pin             = true,
		stay_focused    = true,
		center          = true,
		no_screen_share = true,
	})
end

M.apply = function ()
	no_share()
	no_idle()
	media()
	no_dim()
	no_transparency()
	redirect()
end

return M
