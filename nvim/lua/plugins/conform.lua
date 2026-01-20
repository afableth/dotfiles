return{
  'stevearc/conform.nvim',
  lazy = true,
  event = { "BufRead", "BufNewFile" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    },
  },
}
