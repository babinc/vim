require("toggleterm").setup{}

vim.keymap.set("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "ToggleTerm float" })
vim.keymap.set("n", "<Leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "ToggleTerm vertical" })
vim.keymap.set("n", "<Leader>th", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "ToggleTerm horizontal" })
