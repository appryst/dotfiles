vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<space>", "<Nop>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center Cursor while jumping with Ctrl + D / U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste while preserving clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s)

-- Go to normal mode in Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Tmux-sessionizer (thanks primeagen)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")
