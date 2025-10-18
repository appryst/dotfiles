return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
        { "<leader>fp", function() require("fzf-lua").git_files() end, desc = "Find files" },
        { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
    },
}
