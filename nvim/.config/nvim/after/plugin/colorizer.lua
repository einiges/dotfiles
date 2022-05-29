-- colored rgb #1CE7EA
require('paq').register('norcalli/nvim-colorizer.lua')

local ok, colorizer = pcall(require, 'colorizer')
if not ok then
	return
end

colorizer.setup()

