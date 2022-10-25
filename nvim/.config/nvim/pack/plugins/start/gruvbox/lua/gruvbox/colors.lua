local M = {}

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
	red      = { d='#9D0006', a='#B41211', n='#CC241D', r='#E33628', b='#FB4934' },
	orange   = { d='#AF3A03', a='#C24B08', n='#D65D0E', r='#EA6E13', b='#FE8019' },
	yellow   = { d='#B57614', a='#C6871A', n='#D79921', r='#E8AB28', b='#FABD2F' },
	green    = { d='#79740E', a='#888514', n='#98971A', r='#A8A920', b='#B8BB26' },
	aqua     = { d='#427B58', a='#558C60', n='#689D68', r='#7BAE72', b='#8EC07C' },
	blue     = { d='#076678', a='#267580', n='#458588', r='#649590', b='#83A598' },
	purple   = { d='#8F3F71', a='#A0507B', n='#B16286', r='#C27490', b='#D3869B' },
	gray     = { d='#7C6F64', a='#87796C', n='#928374', r='#9D8E7C', b='#A89984' },

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
	-- c5 dark & bright = gray darker & neutral
	c5       = { d='#87796C',                                        b='#928374' },
}

function M.palette()

	local result = {}
	for color, def in pairs(palette) do
		result[color] = {}
		result[color].n = def.n
		if 'light' == vim.opt.background:get() then
			result[color].h = def.d
			result[color].i = def.a
			result[color].l = def.b
			result[color].o = def.r
		else
			result[color].h = def.b
			result[color].i = def.r
			result[color].l = def.d
			result[color].o = def.a
		end
	end

	return result
end

return M

