return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"L3MON4D3/LuaSnip",     -- Snippet engine
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger menu
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = 'luasnip' }, -- This pulls from BasedPyright
				{ name = 'nvim_lsp' }, -- This pulls from BasedPyright
			})
		})
	end
}
