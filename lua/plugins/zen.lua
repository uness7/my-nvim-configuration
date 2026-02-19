return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = .85, -- width of the Zen window
			options = {
				number = false, -- hide line numbers
				relativenumber = false,
			},
		},
		plugins = {
			gitsigns = { enabled = true }, -- keep git info if you want
			tmux = { enabled = false }, -- hide tmux status bar
		},
	},
	keys = {
		{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "[Z]en [M]ode" }
	}
}
