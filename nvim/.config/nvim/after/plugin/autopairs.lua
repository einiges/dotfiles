PAQ('windwp/nvim-autopairs')

local has_autopairs, autopairs = PREQUIRE('nvim-autopairs')
if not has_autopairs then
	return
end

autopairs.setup({
	disable_in_macro = true,
})

local has_cmp, cmp = PREQUIRE('cmp')
if not has_cmp then
	return
end

cmp.event:on(
	'confirm_done',
	require('nvim-autopairs.completion.cmp').on_confirm_done({
		filetypes = {
			tex = false,
		},
	})
)

