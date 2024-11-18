local none_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

none_ls.setup({
    sources = {
        -- require("none-ls.diagnostics.eslint_d"),
        none_ls.builtins.formatting.biome,
        none_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
