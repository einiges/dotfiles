local M = {}

M.window_rule_dock = function (horizontal, vertical)

	local h = horizontal or 'center'
	local v = vertical   or 'center'

	local result = {}
	if h == 'right' then
		result[1] = [[min(max(monitor_w, 0), monitor_w - window_w)]]
	elseif h == 'center' then
		result[1] = [[min(max(monitor_w, 0), (monitor_w-window_w)*0.5)]]
	else
		result[1] = [[0]]
	end

	if v == 'down' then
		result[2] = [[min(max(monitor_h, 0), monitor_h - window_h)]]
	elseif v == center then
		result[2] = [[min(max(monitor_h, 0), (monitor_h - window_h) * 0.5)]]
	else
		result[2] = [[0]]
	end

	return result
end


M.hostname = function ()
	local hostnamectl = io.popen('hostnamectl hostname', 'r')
	local hostname = hostnamectl:read('*a')
	hostnamectl:close()
	return hostname
end

M.chassis = function ()
	local hostnamectl = io.popen('hostnamectl chassis', 'r')
	local chassis = hostnamectl:read('*a')
	hostnamectl:close()
	return chassis
end


return M
