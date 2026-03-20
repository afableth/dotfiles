return {
  "nvim-treesitter/nvim-treesitter",

  build = ':TSUpdate',

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

--  main = 'nvim-treesitter.configs',

  lazy = false,

  opts = {
    ensure_installed = { "lua", "python", "rust" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  }
}
