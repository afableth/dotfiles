return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.[ruff_lsp].setup{}
    end,
}
