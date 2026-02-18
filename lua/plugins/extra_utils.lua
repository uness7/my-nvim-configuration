return {
	-- Fidget: Shows a spinner when LSP is busy
	{
		"j-hui/fidget.nvim",
		opts = {}, -- Automatically calls setup()
	},

	-- Trouble: A beautiful list for all project errors
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Project Diagnostics" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols Outline" },
		},
		opts = {},
	},

	-- LSP Signature: Helps you fill out function arguments
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require('lsp_signature').setup(opts) end
	},
}
