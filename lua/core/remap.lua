vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserving Register When Pasting:
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Special Paste" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "System Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "System Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "System Clipboard" })

-- Quick Save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- Close Buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>ln", ":set relativenumber!<CR>", { desc = "Toggle Line Numbers" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to right split" })
