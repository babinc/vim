vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep old copy register when pasting
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Special Paste" })

vim.keymap.set("n", "<leader>y", "\"+y", { desc = "System Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "System Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "System Clipboard" })

