require('paq').register('hrsh7th/nvim-cmp') -- TODO: Config
require('paq').register('hrsh7th/cmp-nvim-lsp')
require('paq').register('hrsh7th/cmp-buffer')
require('paq').register('hrsh7th/cmp-path')
require('paq').register('hrsh7th/cmp-cmdline')
require('paq').register('hrsh7th/cmp-calc')
--require('paq').register('hrsh7th/cmp-nvim-lsp-document-symbol')
require('paq').register('hrsh7th/cmp-nvim-lua')
require('paq').register('saadparwaiz1/cmp_luasnip')
require('paq').register('lukas-reineke/cmp-under-comparator')

local ok, cmp = pcall(require, 'cmp')
if not ok then
	return
end

local lspkind = require('lspkind')
local luasnip = require('luasnip')


cmp.setup({
	experimental = {
		ghost_text = true,
	},
	snippet = {
		expand =
			function(args)
				luasnip.lsp_expand(args.body)
			end,
	},
	formatting = {
		format =
			function(entry, item)
				item.kind = string.format("%s %s", lspkind.presets.default[item.kind], item.kind)
				item.menu = ({
					nvim_lsp = "ﲳ",
					nvim_lua = "",
					treesitter = "",
					path = "",
					buffer = "﬘",
					zsh = "",
					luasnip = "",
					spell = "暈",
				})[entry.source.name]
				return item
			end,
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's'}),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
	},
	{
		{ name = 'calc' },
		{ name = 'buffer' },
	}),

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require('cmp-under-comparator').under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	}
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline({}),
	sources = cmp.config.sources(
		{{ name = 'nvim_lsp_document_symbols' }},
		{{ name = 'buffer' }}
	)
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline({}),
	sources = cmp.config.sources(
		{{ name = 'path' }},
		{{ name = 'cmdline' }}
	)
})


