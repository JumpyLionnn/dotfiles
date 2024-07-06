require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

