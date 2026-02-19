return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				defaults = {
					-- This makes the popup look modern and clean
					layout_strategy = "horizontal",
					layout_config = { preview_width = 0.5 },
				}
			})
			-- Load the fzf extension for speed
			telescope.load_extension('fzf')


			-- keymaps
			local builtin = require('telescope.builtin')

			-- File Searching
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind by [G]rep (search text)" })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })

			-- LSP Integration (The "Pro" Stuff)
			vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = "[F]ind [D]efinitions" })
			vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "[F]ind [R]eferences" })
			vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "[F]ind [S]ymbols" })
		end
	}
}
