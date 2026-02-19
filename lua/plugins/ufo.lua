return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		-- 1. Setup Fold Options (Required for UFO)
		vim.o.foldcolumn = '1' -- '0' is also fine if you don't want the side bar
		vim.o.foldlevel = 99 -- Using ufo provider need a large value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- 2. Setup UFO
		require('ufo').setup({
			provider_selector = function(bufnr, filetype, buftype)
				return {'lsp', 'indent'}
			end
		})

		-- 3. Keymaps for folding
		vim.keymap.set('n', 'zR', require('ufo').openAllFolds, {desc = "Open all folds"})
		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, {desc = "Close all folds"})
		vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, {desc = "Fold less"})
		vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, {desc = "Fold more"})
	end,
}
