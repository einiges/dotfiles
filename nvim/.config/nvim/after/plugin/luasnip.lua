PAQ('L3MON4D3/LuaSnip')
PAQ('rafamadriz/friendly-snippets')

if not PREQUIRE('luasnip') then
	return
end

local luasnip = require('luasnip')

luasnip.setup({
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave',
})

vim.keymap.set({ 'i', 's' }, '<C-f>', function()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end)

vim.keymap.set({ 'i', 's' }, '<C-b>', function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)
