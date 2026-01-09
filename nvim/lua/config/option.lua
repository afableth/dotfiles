-- neovim settings
vim.opt.clipboard = 'unnamedplus'
vim.opt.title = true
-- vim.opt.ambiwith = 'double' -- japanese letter
vim.opt.smartindent = true

-- tab option
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = -1
-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,utf-16,sjis," -- ファイル読み込み時推定
vim.opt.list = true -- インデントの表示

-- visual
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Dvorak
vim.api.nvim_set_keymap('n', 'd', 'h', { noremap = true })
vim.api.nvim_set_keymap('n', 'h', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 't', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'l', { noremap = true })

vim.api.nvim_set_keymap('n', 'e', 'd', { noremap = true })
vim.api.nvim_set_keymap('n', 'ee', 'dd', { noremap = true })

vim.api.nvim_set_keymap('n', 'r', 'n', { noremap = true })
vim.api.nvim_set_keymap('n', 'R', 'N', { noremap = true })

vim.api.nvim_set_keymap('v', 'd', 'h', { noremap = true })
vim.api.nvim_set_keymap('v', 'h', 'j', { noremap = true })
vim.api.nvim_set_keymap('v', 't', 'k', { noremap = true })
vim.api.nvim_set_keymap('v', 'n', 'l', { noremap = true })

vim.api.nvim_set_keymap('v', 'e', 'd', { noremap = true })
vim.api.nvim_set_keymap('v', 'ee', 'dd', { noremap = true })

vim.api.nvim_set_keymap('v', 'r', 'n', { noremap = true })
vim.api.nvim_set_keymap('v', 'R', 'N', { noremap = true })

-- swap current and next
vim.keymap.set('n', 'H', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', 'T', ':m .-2<CR>==', { noremap = true, silent = true })

vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
