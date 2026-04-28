vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

require("mason").setup({})

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
  },
})

-- Diagnostic configuration
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
})
