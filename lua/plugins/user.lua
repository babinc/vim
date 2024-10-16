_G.get_dll_path = function()
  -- Define the project directory and locate the .csproj file
  local project_dir = vim.fn.getcwd()
  local csproj_file = vim.fn.glob(project_dir .. '/*.csproj')

  -- Check if a .csproj file exists
  if csproj_file == '' then
    print("No .csproj file found in the project directory.")
    return nil
  end

  local csproj_dir = vim.fn.fnamemodify(csproj_file, ':h')
  local dll_path_file = csproj_dir .. '/dll_path.txt'

  -- Function to save the DLL path to the file
  local function save_dll_path(dll_path)
    local file = io.open(dll_path_file, "w")
    if file then
      file:write(dll_path)
      file:close()
    else
      print("Error: Unable to save DLL path.")
    end
  end

  -- Function to read the DLL path from the file
  local function read_dll_path()
    local file = io.open(dll_path_file, "r")
    if file then
      local dll_path = file:read("*all")
      file:close()
      return dll_path
    else
      return nil
    end
  end

  -- Check if the DLL path file exists
  local dll_path = read_dll_path()
  if dll_path and vim.fn.filereadable(dll_path) == 1 then
    return dll_path
  else
    -- Prompt the user for the DLL path
    dll_path = vim.fn.input('Path to dll: ', csproj_dir .. '\\bin\\Debug', 'file')
    save_dll_path(dll_path)
    return dll_path
  end
end

function ParseLines(data)
  if data then
    local lines = vim.fn.split(table.concat(data, "\n"), "\n")
    local qflist = {}
    for _, line in ipairs(lines) do
      if string.match(line, "error") then
        local filename, lnum, col, errmsg = string.match(line, "([^%(]+)%((%d+),(%d+)%)%: error [^:]+: (.+)")
        if filename and lnum and col and errmsg then
          table.insert(qflist, {
            filename = filename,
            lnum = tonumber(lnum),
            col = tonumber(col),
            text = errmsg
          })
        else
          print("Failed to parse:", line)
        end
      end
    end
    vim.fn.setqflist(qflist, 'r')
    vim.fn.setqflist({}, 'a', { title = 'dotnet build' })
  end
end


-- Function to build the C# project
_G.build_project = function()
  local cmd = 'dotnet build'
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      ParseLines(data)
    end,
    on_stderr = function(_, data)
      ParseLines(data)
    end,
    on_exit = function()
      vim.cmd('copen')
    end,
  })
end

-- Function to build and start debugging
_G.build_and_debug = function()
  -- Modify the build command based on your project setup
  local build_command = 'dotnet build'
  vim.fn.jobstart(build_command, {
    cwd = vim.fn.getcwd(),
    on_exit = function(_, code)
      if code == 0 then
        -- Build successful, now start debugging
        require('dap').run({
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
        })
      else
        print('Build failed. Unable to start debugging.')
      end
    end,
  })
end

-- Ensure that this is executed after setting up the LSP
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
  end,
})


if true then return {
  'junegunn/vim-easy-align', -- Plugin for alignment

  -- Trouble plugin
  {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  },
  {
    'MattesGroeger/vim-bookmarks',  -- Bookmark plugin
    config = function()
      vim.g.bookmark_sign = '⚑'  -- Change bookmark sign to a flag
      vim.g.bookmark_save_per_working_dir = 1  -- Save bookmarks per working directory
    end,
  },
  {
    'tom-anders/telescope-vim-bookmarks.nvim',  -- Telescope integration for vim-bookmarks
    requires = { 'nvim-telescope/telescope.nvim', 'MattesGroeger/vim-bookmarks' },
    config = function()
      require('telescope').load_extension('vim_bookmarks')
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   config = function()
  --     require("rust-tools").setup({})
  --   end,
  -- },
} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
