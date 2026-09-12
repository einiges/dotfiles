local M = {}

--- Calculate the coordinates to place a window at the edge of the monitor
--- @param horizontal string 'left'|'center'|'right'
--- @param vertical string 'up'|'top'|'center'|'down'|'bottom'
--- @return table coordinates
M.window_rule_dock = function (horizontal, vertical)

	local h = horizontal or 'center'
	local v = vertical   or 'center'

	-- FIXME: respect window border size, instead of default
	local bsize = hl.get_config('general.border_size')

	local hp = '0'
	if h == 'left' then
		hp = ([[%d]]):format(bsize)
	elseif h == 'center' then
		hp = [[min(max(monitor_w, 0), (monitor_w-window_w)*0.5)]]
	elseif h == 'right' then
		hp = ([[min(max(monitor_w, 0), monitor_w-window_w) - %d]]):format(bsize)
	end


	local vp
	if v == 'up' or v == 'top' then
		vp = ([[%d]]):format(bsize)
	elseif v == 'center' then
		vp = [[min(max(monitor_h, 0), (monitor_h-window_h) * 0.5)]]
	elseif v == 'down' or v == 'bottom' then
		vp = ([[min(max(monitor_h, 0), monitor_h-window_h) - %d]]):format(bsize)
	end

	return { hp, vp }
end

M.hostname = function ()
	local hostnamectl = io.popen('hostnamectl hostname', 'r')
	if not hostnamectl then
		return 'unknown'
	end
	local hostname = hostnamectl:read('*a')
	hostnamectl:close()
	return hostname
end

M.chassis = function ()
	local hostnamectl = io.popen('hostnamectl chassis', 'r')
	if not hostnamectl then
		return 'unknown'
	end
	local chassis = hostnamectl:read('*a')
	hostnamectl:close()
	return chassis
end

M.monitor_orientation = function (mon)
	local monitor = mon or hl.get_active_monitor()
	if not monitor then
		return nil
	end

	local w = monitor.width
	local h = monitor.height

	if monitor.transform == 1 or monitor.transform == 3 then
		w, h = h, w
	end

	return (w >= h and 'landscape') or 'portrait'
end

M.window_region = function (win)
	local window = win or hl.get_active_window()
	if not window then
		return
	end

	local region = ('%d,%d %dx%d'):format(
		window.at.x,
		window.at.y,
		window.size.x,
		window.size.y
	)
	return region
end

M.workspace_region = function (ws)
	local monitor = ws or hl.get_active_workspace().monitor
	if not monitor then
		return
	end

	local region = ('%d,%d %dx%d'):format(
		monitor.x + monitor.reserved.left,
		monitor.y + monitor.reserved.top,
		monitor.width  - monitor.reserved.left - monitor.reserved.right,
		monitor.height - monitor.reserved.top - monitor.reserved.bottom
	)
	return region
end

M.monitor_region = function (mon)
	local monitor = mon or hl.get_active_monitor()
	if not monitor then
		return
	end

	local region = ('%d,%d %dx%d'):format(
		monitor.x,
		monitor.y,
		monitor.width,
		monitor.height
	)
	return region
end

return M
