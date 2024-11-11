local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { noremap = true, silent = true, desc = "Harpoon Add" })
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { noremap = true, silent = true, desc = "Toggle Harpoon" })

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { noremap = true, silent = true })
--
