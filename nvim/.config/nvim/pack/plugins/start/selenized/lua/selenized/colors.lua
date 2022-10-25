local T = {}

local palette = {
	-- ,-------,----------------------------------------------------------------,
	-- | bg=   |                          Description                           |
	-- |=======|============|============|============|============|============|
	-- | dark  | (d)ark    <-----,       |            |       ,----->(b)right   |
	-- |   &   |            | d(a)rker  <-----,  ,----->b(r)ighter |            |
	-- | light |            |            | (n)eutral  |            |            |
	-- |-------+------------+------------+------------+------------+------------|
	-- | dark  | (l)ow      | l(o)wer    |   ______   | h(i)gher   | (h)igh     |
	-- |       | contrast   | contrast   |            | contrast   | contrast   |
	-- |-------+------------+------------+------------+------------+------------|
	-- | light | (h)igh     | h(i)gher   |   ______   | l(o)wer    | (l)ow      |
	-- |       | contrast   | contrast   |            | contrast   | contrast   |
	-- |-------+------------+------------+------------+------------+------------|
	bg0     = { dn='#181818', db='#B41211', ln='#ffffff', lb='#2d5b69' },
	bg1     = { dn='#252525', db='#B41211', ln='#ebebeb', lb='#2d5b69' },
	bg2     = { dn='#3b3b3b', db='#B41211', ln='#cdcdcd', lb='#2d5b69' },
	dim0    = { dn='#777777', db='#B41211', ln='#878787', lb='#2d5b69' },
	fg0     = { dn='#b9b9b9', db='#B41211', ln='#474747', lb='#2d5b69' },
	fg1     = { dn='#dedede', db='#B41211', ln='#282828', lb='#2d5b69' },

	black   = { dn='#ece3cc', db='#B41211', ln='#184956', lb='#2d5b69' },
	red     = { dn='#ed4a46', db='#ff5e56', ln='#d6000c', lb='#bf0000' },
	green   = { dn='#70b433', db='#83c746', ln='#1d9700', lb='#008400' },
	yellow  = { dn='#dbb32d', db='#efc541', ln='#c49700', lb='#af8500' },
	blue    = { dn='#368aeb', db='#4f9cfe', ln='#0064e4', lb='#0054cf' },
	magenta = { dn='#eb6eb7', db='#ff81ca', ln='#dd0f9d', lb='#c7008b' },
	cyan    = { dn='#3fc5b7', db='#56d8c9', ln='#00ad9c', lb='#009a8a' },
	orange  = { dn='#e67f43', db='#fa9153', ln='#d04a00', lb='#ba3700' },
	violet  = { dn='#a580e2', db='#b891f5', ln='#7f51d6', lb='#6b40c3' },
	white   = { dn='#d5cdb6', db='#B41211', ln='#72898f', lb='#cad8d9' },

	-- |-------+------------+------------+------------+------------+------------|
	-- | dark  | background |                                      | foreground |
	-- |-------+------------+------------+------------+------------+------------|
	-- | light | foreground |                                      | background |
	-- |-------+------------+------------+------------+------------+------------|
	c00      = { d='#1D2021',                                        b='#FAF5D7' },
	c0       = { d='#282828',                                        b='#FBF1C7' },
	c01      = { d='#32302F',                                        b='#F2E5BC' },
	c1       = { d='#3C3836',                                        b='#EBDBB2' },
	c2       = { d='#504945',                                        b='#D5C4A1' },
	c3       = { d='#665C54',                                        b='#BDAE93' },
	-- c4 dark & bright = gray dark & bright
	c4       = { d='#7C6F64',                                        b='#A89984' },
	-- c5 dark & bright = gray dark & darker
	c5       = { d='#87796C',                                        b='#928374' },
}


function T.palette()

	local result = {}
	for color,def in pairs(palette) do
		result[color] = {}
		if vim.opt.background:get() == 'light' then
			result[color].n = def.ln
			result[color].b = def.lb
		else
			result[color].n = def.dn
			result[color].b = def.db
		end
	end

	return result
end

return T

