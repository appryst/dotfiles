vim.pack.add({
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  }
})

require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    blink_cmp = true,
    harpoon = true,
    mason = true,
    mini = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
    },
    treesitter = true,
  },
  custom_highlights = function()
    return {
      MiniJump = { link = "IncSearch" },
    }
  end,
})

vim.cmd.colorscheme("catppuccin-mocha")
