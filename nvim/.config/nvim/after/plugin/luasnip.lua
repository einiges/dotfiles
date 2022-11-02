PAQ('L3MON4D3/LuaSnip')
PAQ('rafamadriz/friendly-snippets')

if not PREQUIRE('luasnip') then
	return
end

require('luasnip').setup({
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave',
})

