
PAQ = function(pkg)
	if not pcall(require, 'paq') then
		return
	end

	require('paq').register(pkg)
end
