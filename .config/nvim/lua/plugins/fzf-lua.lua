return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {
        keymap = {
            fzf = {
                true,
                -- Use <c-q> to select all items and add them to the quickfix list
                ["ctrl-q"] = "select-all+accept",
            }
        }
    },
    keys = {
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
        { "<leader>fp", function() require("fzf-lua").git_files() end, desc = "Find files" },
        { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
        { "<leader>xx", function() require("fzf-lua").diagnostics_workspace() end, desc = "Diagonstics Workspace" },
    },
}
