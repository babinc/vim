require("neo-tree").setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  default_component_configs = {
    git_status = {
      symbols = {
        added     = "✚",  -- or any other icon you prefer
        modified  = "",
        deleted   = "✖",
        renamed   = "",
        untracked = "★",
        ignored   = "◌",
        unstaged  = "✗",
        staged    = "✓",
        conflict  = "",
      },
    },
  },
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    }
  }
})

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neo-tree" })
