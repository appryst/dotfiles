return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		keys = {
			{ "<leader>qp", "<cmd>QuartoPreview<cr>", silent = true, noremap = true, desc = "Quarto Preview" },
		},
	},
}
