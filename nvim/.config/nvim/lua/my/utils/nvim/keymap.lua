
local Keymap = {}

-- Allow mappings like
-- map({*opts}):{OPT()}:set({mode}, lhs, rhs, {*opts}

local new = function(mode, opts)
	return setmetatable(
		{
			mandatory = {
				mode = mode or 'n',
			},
			opts = opts or {},
		},
		require('my.utils.lua.class').sup(Keymap))
end

---Add keymap
---@param lhs string
---@param rhs string
---@param opts table|nil
---@return Keymap
function Keymap:setX(lhs, rhs, opts)
	self:set(self.mandatory.mode, lhs, rhs, vim.tbl_extend('force', self.opts, opts or {}))
	return self
end

---Add keymap
---@param mode string|table
---@param lhs string
---@param rhs string
---@param opts table|nil
---@return Keymap
function Keymap:set(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', self.opts, opts or {}))
	return self
end

---Set mode inplace
---@param mode string|table
---@return Keymap
function Keymap:mode(mode)
	local n = self:copy()
	n.mandatory.mode = mode or 'n'
	return n
end

-- Options

local with = function(keymap, opt)
	local n = keymap:copy()
	n.opts = vim.tbl_extend('force', keymap.opts, opt or {})
	return n
end

function Keymap:buffer(val)
	return with(self, {buffer = val or true})
end

function Keymap:desc(val)
	return with(self, {desc = val})
end

function Keymap:silent(val)
	return with(self, {silent = val or true})
end

function Keymap:expr(val)
	return with(self, {expr = val or true})
end

function Keymap:remap(val)
	return with(self, {remap = val or true})
end


return new

