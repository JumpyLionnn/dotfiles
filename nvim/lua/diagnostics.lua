vim.diagnostic.config({
    virtual_text = true,
    underline = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
        },
    },
    severity_sort = true,
})

