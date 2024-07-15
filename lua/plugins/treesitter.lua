if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "csharp",
      "rust",
      "javascript",
      "go",
      "markdown",
      "json",
      "gitignore",
      "c",
      "cpp",
      "python",
      "sql",
      "vue",
      "xml",
      "zig",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
