-- colored rgb #1CE7EA
PAQ('norcalli/nvim-colorizer.lua')

if not PREQUIRE('colorizer') then
	return
end

require('colorizer').setup()

