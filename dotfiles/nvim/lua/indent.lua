local function set_indent(width, use_spaces)
  vim.opt_local.shiftwidth = width
  vim.opt_local.tabstop = width
  vim.opt_local.softtabstop = width
  vim.opt_local.expandtab = use_spaces
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "nix",
    "lua",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
    "jsonc",
    "yaml",
    "html",
    "css",
  },
  callback = function()
    set_indent(2, true)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",
    "rust",
    "c",
    "cpp",
  },
  callback = function()
    set_indent(4, true)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    set_indent(4, false)
  end,
})

