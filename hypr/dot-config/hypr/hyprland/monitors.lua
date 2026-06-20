local M = {}
-- https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Recommended rule for quickly plugging in random monitors
M.apply = function ()
	hl.monitor({
		output = '',
		mode = 'preferred',
		position = 'auto',
		scale = 1,
	})
end

return M
