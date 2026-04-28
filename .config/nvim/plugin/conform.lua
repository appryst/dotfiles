vim.pack.add({
  'https://github.com/stevearc/conform.nvim',
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    cpp = { "clang-format" },
    c = { "clang-format" }
  },
})

vim.keymap.set("n", "<leader>fo", function() require("conform").format({ bufnr = 0 }) end, { desc = "Format buffer" })
