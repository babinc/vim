require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "float",  -- Set to floating window
  close_on_exit = true,  -- Close the terminal when lazygit exits
  float_opts = {
    border = "curved",  -- Border style for the floating window
    width = 150,
    height = 45,
    winblend = 3,
  },
  on_create = function(t)
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
    if t.hidden then
      local function toggle() t:toggle() end
      vim.keymap.set({ "n", "t", "i" }, "<C-'>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
      vim.keymap.set({ "n", "t", "i" }, "<F7>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
    end
  end,
}

-- Key mappings for navigating between splits in terminal mode
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "ToggleTerm float" })
vim.keymap.set("n", "<Leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "ToggleTerm vertical" })
vim.keymap.set("n", "<Leader>th", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "ToggleTerm horizontal" })
-- Custom function to open lazygit in a floating toggleterm window
vim.keymap.set("n", "<leader>gg", function()
  require("toggleterm.terminal").Terminal
    :new({ cmd = "lazygit", hidden = true, direction = "float" })
    :toggle()
end, { noremap = true, silent = true, desc = "Toggle lazygit" })
