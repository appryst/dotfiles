return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup({})
		require("mini.surround").setup({})
		require("mini.ai").setup({})
		require("mini.jump").setup({})
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = {
					add = "┃",
					change = "┃",
					delete = "_",
				},
			},
		})
	end,
}
