vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<space>", "<Nop>")

-- Clashes with mini surround
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center Cursor while jumping with Ctrl + D / U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Cursor stays when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Center search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste while preserving clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Go to normal mode in Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Tmux-sessionizer (thanks primeagen)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")

-- Navigate quickfix and loclist
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

