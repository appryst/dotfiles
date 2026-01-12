return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            float = {
                transparent = true,
            },
            auto_integrations = true,
            -- Mini.nvim jump highlight color
            custom_highlights = function()
                return {
                    MiniJump = { link = "IncSearch" },
                }
            end,
        })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
