return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
        ignore_install = {"latex"},
        ensure_installed = {
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "c",
          "query"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          -- disable = { "python", "c" }
        },
      })
  end
}
