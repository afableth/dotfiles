vim.lsp.config('rust_ls', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = {
    'uv.lock',
    'pyproject.toml',
    '.venv',
    '.git',
  },
})

vim.lsp.config('python_ls', {
  cmd = { 'pyright' },
  filetypes = { 'python' },
  root_markers = {
    'Cargo.toml',
    '.git',
  },
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.git',
  },
})

vim.lsp.config('nil_ls', {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = {
    'flake.nix',
    '.git',
  },
})

vim.lsp.config('solidity_ls', {
  cmd = { 'solc', '--lsp' },
  filetypes = { 'solidity' },
  root_markers = {
    'foundry.toml',
    'hardhat.config.js',
    'hardhat.config.ts',
    '.git',
  },
})

vim.lsp.config('astro_ls', {
  cmd = { 'astro-ls' },
  filetypes = { 'astro' },
  root_markers = {
    '.git',
  },
})

vim.lsp.completion.enable()
vim.o.completeopt = 'menuone,noselect,fuzzy'
vim.o.autocomplete = true
vim.o.autocompletedelay = 200

vim.lsp.enable({ 'lua_ls', 'nil_ls', 'solidity_ls', 'astro_ls' })

