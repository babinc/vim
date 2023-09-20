require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c_sharp",
    "diff",
    "gitcommit",
    "bash",
    "comment",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "jsonc",
    "lua",
    "markdown",
    "regex",
    "scss",
    "toml",
    "typescript",
    "yaml",
    "svelte",
    "vim",
    "toml",
    "rust",
    "norg"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
