return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    cpp = { "clang-format"},
    c = { "clang-format"}
  },
  },
  keys = {
    {"<leader>fo", function() require("conform").format({ bufnr = 0 }) end}
  }
}
