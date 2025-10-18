return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    lazygit = { enabled = true}
  },
  keys = {
      { "<leader>lg", function() require("snacks").lazygit() end, desc = "Open Lazygit" },
    }
}
