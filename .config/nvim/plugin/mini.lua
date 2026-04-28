vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})

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
