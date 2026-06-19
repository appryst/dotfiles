vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	picker = { enabled = true },
	statuscolumn = { enabled = true, left = { "sign" } },
})

-- Snacks keymaps
vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
