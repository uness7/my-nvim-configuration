return {
	"karb94/neoscroll.nvim",
	config = function()
		require('neoscroll').setup({
			easing_function = "quadratic" -- Smooth start, smooth stop
		})
	end
}
