vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })

vim.opt.ambiwidth = 'double'

vim.opt.clipboard:append({unnamedplus = true})

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = {tab = '>-', trail = '*', nbsp = '+'}
vim.opt.smartindent = true

vim.opt.visualbell = true

vim.opt.expandtab = true

require("indent")
