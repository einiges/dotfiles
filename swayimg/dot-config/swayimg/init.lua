local W = setmetatable({
	v = swayimg.viewer,
	g = swayimg.gallery,
	s = swayimg.slideshow,
}, {
		__index = function(_, key)
			local accessor = swayimg[swayimg.mode][key]

			return type(accessor) ~= 'function'
				and accessor
				or function(...)
					return accessor(...)
				end
		end,

		__newindex = function(_, key, value)
			swayimg[swayimg.mode][key] = value
		end,
	}
)

swayimg.dnd_button = 'MouseRight'

swayimg.text.status_timeout = 3
swayimg.text.timeout = 0
swayimg.text.visible = false

swayimg.imagelist.adjacent = true


-- ALL
for _, mode in ipairs({'viewer', 'slideshow', 'gallery'}) do
	local m = swayimg[mode]

	m.bind_reset()
end

-- SINGLE IMAGE VIEWER
for _, mode in ipairs({'viewer', 'slideshow'}) do
	local m = swayimg[mode]

	m.set_default_scale = 'fit'
	m.autocenter = true
	m.drag_button = 'MouseLeft'
	m.loop = true
	m.preload = 1
	m.history = 1

	m.set_window_background(0x00000000)
	m.set_image_background(0x00000000)
end


-- GALLERY

W.g.padding_size = 20
W.g.border_size  = 5
W.g.window_color     = 0xFFfbf1c7
W.g.border_color     = 0xFF9C000e
W.g.selected_color   = 0xFFfbf1c7
W.g.unselected_color = 0xFFfbf1c7

W.v.mark_color = 0xFF8ec07c
W.g.mark_color = 0xFF8ec07c
W.s.mark_color = 0xFF8ec07c

-- BINDINGS

--- Bind keys according to swayimg mode
--- @param mode table|string may be v (viewer), g (gallery) or s (slideshow) to
--- bind keyboard sequences, or uppercase (V, G, or S) to instead bind to mouse
--- sequences. When using multiple modes, make sure to consider it in action.
--- It is probably unwise to mix keyboard and mouse sequences into one action.
--- @param sequence table|string
--- @param action function
local bind = function(mode, sequence, action)
	local binder = {
		v = swayimg.viewer.on_key,
		V = swayimg.viewer.on_mouse,
		g = swayimg.gallery.on_key,
		G = swayimg.gallery.on_mouse,
		s = swayimg.slideshow.on_key,
		S = swayimg.slideshow.on_mouse,
	}

	local modes     = type(mode)     == 'table' and mode or { mode }
	local sequences = type(sequence) == 'table' and sequence or { sequence }

	for _, mo in ipairs(modes) do
		for _, seq in ipairs(sequences) do
			binder[mo](seq, action)
		end
	end
end

local next_frame = function()
	W.frame = math.min(W.get_image().frames, W.frame + 1)
end

local prev_frame = function()
	W.frame = math.max(0, W.frame - 1)
end

local zoom_in = function()
	local mouse = swayimg.get_mouse_pos()
	local scale = W.scale
	W.set_abs_scale(
		scale + scale / 10,
		mouse.x,
		mouse.y
	)
end

local zoom_out = function()
	local mouse = swayimg.get_mouse_pos()
	local scale = W.scale
	W.set_abs_scale(
		scale - scale / 10,
		mouse.x,
		mouse.y
	)
end

local is_image_fitting = function()
	local wsize = swayimg.get_window_size()
	local img   = W.get_image()

	-- maybe rounding issue?
	return
		(img.width  * W.scale) <= wsize.width and
		(img.height * W.scale) <= wsize.height
end

local position_change = function(direction)
	local horizontal_directions = {
		left  = W.get_position().x + 100,
		right = W.get_position().x - 100,
	}
	local vertical_directions = {
		up    = W.get_position().y + 100,
		down  = W.get_position().y - 100,
	}

	W.set_abs_position(
		horizontal_directions[direction] or W.get_position().x,
		vertical_directions[direction]   or W.get_position().y
	)
end

local trash_current = function()
	local img = W.get_image()
	if img == nil then
		return
	end
	os.execute(([[trash-put '%s']]):format(img.path:gsub([[']], [['"'"']])))
end

local trash_marked = function()
	local images = swayimg.imagelist.get()
	for _, image in ipairs(images) do
		if image.mark then
			os.execute(([[trash-put '%s']])
				:format(image.path:gsub([[']], [['"'"']])))
		end
	end
end


local mode_toggle = function(mode_a, mode_b)
	swayimg.mode = swayimg.mode == mode_a
			and mode_b
			or mode_a
end



-- ALL

bind({'v', 'g', 's'}, 'Ctrl+p', function()
	local images = swayimg.imagelist.get()
	for _, image in ipairs(images) do
		if image.mark then
			io.write(('%s\0'):format(image.path))
			io.flush()
		end
	end
end)

bind({'v','g','s'}, 'i', function()
	swayimg.text.visible = not swayimg.text.visible
end)
bind({'v','g','s'}, 't', function()
	W.mark_image()
end)
bind({'v','g','s'}, 'Shift+F', function()
	swayimg.fullscreen = not swayimg.fullscreen
end)

bind({'v','g','s'}, 'Delete',       trash_current)
bind({'v','g','s'}, 'Shift+Delete', trash_marked)

bind({'v','g','s'}, {'q', 'x'},    swayimg.exit)
bind({'V','G','S'}, 'MouseMiddle', swayimg.exit)

bind({'v','g','s'}, 'v',            function() mode_toggle('viewer', 'gallery') end)
bind({'v','g','s'}, {'g','Return'}, function() mode_toggle('gallery', 'viewer') end)
bind({'v','g','s'}, 's',            function() mode_toggle('slideshow', 'gallery') end)


-- SINGLE IMAGE VIEWER
local mnext = function() W.open('next') end
local mprev = function() W.open('prev') end
bind({'v','s'}, {'next',        'n', 'Shift+p',       'space'}, mnext)
bind({'v','s'}, {'prior', 'Shift+n',       'p', 'Shift+space'}, mprev)
bind({'V','S'}, {'ScrollDown', 'MouseSide'},  mnext)
bind({'V','S'}, {'ScrollUp',   'MouseExtra'}, mprev)

bind({'v','s'}, 'Home', function() W.open('first') end)
bind({'v','s'}, 'End',  function() W.open('last') end)

bind({'v','s'}, 'plus',            zoom_in)
bind({'v','s'}, 'minus',           zoom_out)
bind({'V','S'}, 'Ctrl+ScrollUp',   zoom_in)
bind({'V','S'}, 'Ctrl+ScrollDown', zoom_out)
bind({'v','s'}, 'equal',           W.reset)

bind({'v','s'}, 'c',     function() W.set_fix_position('center') end)

-- change position or image based on image scaling
for pdir, odir in pairs({
	left  = 'prev',
	down  = 'next',
	right = 'next',
	up    = 'prev'
}) do
	bind({'v','s'}, pdir, function()
		if   is_image_fitting()
		then W.open(odir)
		else position_change(pdir)
		end
	end)
end

bind({'v','s'}, '.', next_frame)
bind({'v','s'}, ',', prev_frame)

-- VIEWER

bind('v', 'r',       function() W.rotate(90)  end)
bind('v', 'Shift+r', function() W.rotate(270) end)

bind('v', 'm',       W.flip_vertical)
bind('v', 'Shift+m', W.flip_horizontal)


-- GALLERY

bind('G', 'MouseLeft',  function() swayimg.mode = 'viewer' end)

bind('g', 'Left',       function() W.select('left') end)
bind('g', 'Right',      function() W.select('right') end)
bind('g', 'Up',         function() W.select('up') end)
bind('g', 'Down',       function() W.select('down') end)
bind('G', 'ScrollUp',   function() W.select('pgup') end)
bind('G', 'ScrollDown', function() W.select('pgdown') end)
bind('g', 'Home',       function() W.select('first') end)
bind('g', 'End',        function() W.select('last') end)



