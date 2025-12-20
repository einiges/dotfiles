local spec = {
	{
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp-document-symbol',
		'hrsh7th/cmp-nvim-lua',
		'saadparwaiz1/cmp_luasnip',
		'onsails/lspkind-nvim',
	}
}

spec.opts = {
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

	snippet = {
		expand = function(args)
			local has_luasnip, luasnip = pcall('require', 'luasnip')
			if has_luasnip then
				luasnip.lsp_expand(args.body)
			end
		end,
	}

	view = {
		entries = { name = 'custom', selection_order = 'near_cursor' },
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = 'text',
			maxwidth = 50,
			ellipsis_char = '…',
		}),
	}
}

spec.config = function(_, opts)
	local cmp = require('cmp')
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

end


return spec
