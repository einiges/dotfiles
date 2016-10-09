#!/usr/bin/env lua

--[[
-- Add the following lines to your conky.config section in your conky configuration
--
-- lua_load         = 'path/to/this/script.lua',
-- lua_startup_hook = 'startup',
--
--]]

--[[ Configuration ]]
_icon_dir   = '.xmonad/icons/'
_icon_left  = 'left.xbm'
_icon_right = 'right.xbm'

--[[ Colors without '#' ]]
_sec_bg    = '1f1f1f' -- Section Background color
_sec_fg    = '999999' -- Section Foreground color
_sec_ti_fg = '999999' -- Section Foreground color for Title
_bar_bg    = '000000' -- Bar Background color


--[[ Startup ]]--
function conky_startup()
  icon_left  = icon_path(_icon_left)
  icon_right = icon_path(_icon_right)

  sec_ti_fg = fg(_sec_ti_fg)

  sec_fg    = fg(_sec_fg)
  sec_fg_bg = bg(_sec_fg)

  sec_bg    = bg(_sec_bg)
  sec_bg_fg = fg(_sec_bg)

  bar_bg    = bg(_bar_bg)
  bar_bg_fg = fg(_bar_bg)
end


--[[ Conky Functions ]]--

function conky_section_opening(title, fgc)
  if title then
    title_fg = fgc and fg(fgc) or sec_ti_fg
  end
	title = title or ''

  return "^p(2)^ib(1)" ..
         sec_bg_fg     ..
         icon_left     ..
         "^r(920x16)"  ..
         "^p(-920)"    ..
         "^p()"        ..
         title_fg      ..
         "^p(2;1)"     ..
         title
end

function conky_element(arg, fgc)
  fgc = fgc and fg(fgc) or ''
  return fgc .. arg
end

function conky_section_closing()
  return "^p()^p(2)"  ..
         sec_bg_fg    ..
         icon_right   ..
         bar_bg_fg    ..
         "^r(920x16)^p(-920)^ib(0)^p()"
end

local buffer = conky_b
function conky_b()
  return '^p(8)'
end

local half_buffer = conky_hb
function conky_hb()
  return '^p(4)'
end


--[[ Dzen Wrapper ]]--

function icon_path(icon, dir)
  return '^i(' .. (dir or _icon_dir) .. icon .. ')'
end

function fg(color)
  return "^fg(\\#" .. color .. ")"
end

function bg(color)
  return "^bg(\\#" .. color .. ")"
end

function shift(x, y)
  return "^p(" .. x .. ";" .. y .. ")"
end

function rectangle(x, y)
  return "^r(" .. x .. "x" .. y .. ")"
end

function ignore_background(int)
  return "^ib(" .. int .. ")"
end


function conky_format(format, number)
  return string.format(format, conky_parse(number))
end

