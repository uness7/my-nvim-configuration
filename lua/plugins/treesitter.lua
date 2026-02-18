return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',
	opts = {
		ensure_installed = {'python'},
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
}
