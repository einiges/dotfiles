PAQ('petertriho/nvim-scrollbar')

if not PREQUIRE('scrollbar') then
	return
end

require('scrollbar').setup()
