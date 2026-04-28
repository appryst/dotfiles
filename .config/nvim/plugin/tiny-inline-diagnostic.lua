vim.pack.add({
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

require("tiny-inline-diagnostic").setup({
	preset = "classic",
	transparent_bg = true,
	options = {
		multilines = { enabled = true },
		show_all_diags_on_cursorline = true,
	},
})
