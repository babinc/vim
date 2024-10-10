-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Add your plugin setup for nvim-dap and nvim-dap-ui here
require('lazy').setup({
--Add nvim-dap and nvim-dap-ui plugins
 'mfussenegger/nvim-dap',
 {
   'rcarriga/nvim-dap-ui',
   requires = {'mfussenegger/nvim-dap'}
 },
 'theHamsta/nvim-dap-virtual-text',  -- Optional for virtual text
})

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- Configure the .NET Core Debugger
dap.adapters.coreclr = {
  type = 'executable',
  command = 'C:\\tools\\netcoredbg\\netcoredbg.exe', -- Adjust the path if needed
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      local dll_path = get_dll_path()
      if dll_path then
        return dll_path
      else
        error("Unable to find .csproj file or DLL path.")
      end
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = false,
  },
}

-- -- Configure Trouble
-- require('trouble').setup({
--   mode = 'document_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
--   auto_open = false,
--   auto_close = true,
--   auto_preview = true,
--   auto_fold = false,
--   auto_jump = {'lsp_definitions'},
--   signs = {
--     error = '',
--     warning = '',
--     hint = '',
--     information = ''
--   },
--   use_diagnostic_signs = false -- use the signs defined in your lsp client
-- })

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "packages",
      "obj",
      "bin",
    }
    -- vimgrep_arguments = {
    --   'rg',
    --   '--color=never',
    --   '--no-heading',
    --   '--with-filename',
    --   '--line-number',
    --   '--column',
    --   '--smart-case',
    --   '--ignore',
    --   '--hidden',
    --   '--glob',
    --   '!packages/**',
    --   '!node_modules/**'
    -- },
    -- other configuration options
  }
}

-- Keep visual selection after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Bookmarks
vim.api.nvim_set_keymap('n', '<leader>bm', ':Telescope vim_bookmarks current_file<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ba', ':Telescope vim_bookmarks all<CR>', { noremap = true, silent = true })


-- -- Add keybindings
vim.api.nvim_set_keymap('n', '<leader>dui', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>di', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>do', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>du', ':lua require("dap").step_out()<CR>', { noremap = true, silent = true })
-- 
-- -- Key binding to trigger build
vim.api.nvim_set_keymap('n', '<leader>lb', '<cmd>lua build_project()<CR>', { noremap = true, silent = true })
-- 
-- -- Key binding to trigger debug
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua build_and_debug()<CR>', { noremap = true, silent = true })
-- 
-- -- Keybinding for aligning equal signs in normal and visual mode
vim.api.nvim_set_keymap('n', '<leader>ae', ':%EasyAlign =<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>ae', ':EasyAlign =<CR>', { noremap = true, silent = true })
-- 
-- -- Set keybindings for Trouble
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', { noremap = true, silent = true })
