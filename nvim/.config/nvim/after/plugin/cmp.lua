PAQ('hrsh7th/nvim-cmp')
PAQ('hrsh7th/cmp-nvim-lsp')
PAQ('hrsh7th/cmp-nvim-lsp-signature-help')
PAQ('hrsh7th/cmp-buffer')
PAQ('hrsh7th/cmp-path')
PAQ('hrsh7th/cmp-cmdline')
PAQ('hrsh7th/cmp-nvim-lsp-document-symbol')
PAQ('hrsh7th/cmp-nvim-lua')
PAQ('saadparwaiz1/cmp_luasnip')
PAQ('onsails/lspkind-nvim')

if not PREQUIRE('cmp') then
	return
end

vim.opt.completeopt = {
	'menu',
	'menuone',
	'noselect',
}

local cmp = require('cmp')

local settings = {
	experimental = {
		ghost_text = true,
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
		{ name = 'buffer',
			keyword_length = 5,
		},
	}),

	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),

		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

		['<C-n>'] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		['<C-p>'] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
	}),

	view = {
		entries = { name = 'custom', selection_order = 'near_cursor' },
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
}

local has_luasnip, luasnip = PREQUIRE('luasnip')
if has_luasnip then
	settings.snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	}
end

local has_lspkind, lspkind = PREQUIRE('lspkind')
if has_lspkind then
	settings.formatting = {
		format = lspkind.cmp_format({
			mode = 'text',
			maxwidth = '50',
			ellipsis_char = '…',
		}),
	}
end

cmp.setup(settings)

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp_document_symbols', group_index = 0},
		{ name = 'buffer', group_index = 1},
	}),
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path', group_index = 0 },
		{ name = 'cmdline', group_index = 1 },
	}),
})
