vim.pack.add({
  'https://github.com/folke/trouble.nvim',
})

require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", function()
  local exclude = {
    copilot = true,
    null_ls = true,
  }

  for _, client in ipairs(vim.lsp.get_clients()) do
    if not exclude[client.name] then
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end
  require("trouble").toggle("diagnostics")
end, { desc = "Populate Workspace Diagnostics and Toggle Trouble" })

vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
