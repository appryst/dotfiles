return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {},
    lazygit = {}
  },
  keys = {
      { "<leader>lg", function() require("snacks").lazygit() end, desc = "Open Lazygit" },
    }
}
