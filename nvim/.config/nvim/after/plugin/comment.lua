-- easy commenting
require('paq').register('numToStr/Comment.nvim')

local ok, comment = pcall(require, 'Comment')
if not ok then
	return
end


comment.setup {
	padding = false,

	-- Setup for ts-context-commentstring
	-- (see also config for ts_context_commentstring.lua)
	pre_hook = function(ctx)
		local U = require('Comment.utils')

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require('ts_context_commentstring.utils').get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require('ts_context_commentstring.utils').get_visual_start_location()
		end

		return require('ts_context_commentstring.internal').calculate_commentstring {
			key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
			location = location,
		}
	end,
}

