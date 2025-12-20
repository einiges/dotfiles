PAQ('L3MON4D3/LuaSnip')
PAQ('rafamadriz/friendly-snippets')

local ok, plugin = PREQUIRE('luasnip')
if not ok then
	return not ok
end

local luasnip = require('luasnip')

luasnip.setup({
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave',
})


vim.keymap.set({ 'i', 's' }, '<C-f>',
	function()
		if require('luasnip').jumpable(1) then
			require('luasnip').jump(1)
		end
	end
)

vim.keymap.set({ 'i', 's' }, '<C-b>',
	function()
		if require('luasnip').jumpable(-1) then
			require('luasnip').jump(-1)
		end
	end
)
