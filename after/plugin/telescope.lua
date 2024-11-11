local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
  use({
    "rebelot/heirline.nvim",
    -- You can optionally lazy-load heirline on UiEnter
    -- to make sure all required plugins and colorschemes are loaded before setup
    -- event = "UiEnter",
    -- config = function()
    --   require("heirline").setup({})
    -- end
  })
end, { desc = "Search With Grep" })

-- Mapping for finding files in ~/.config/nvim
vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({ cwd = "~/.config/nvim" })
end, { desc = "Find files in ~/.config/nvim" })
