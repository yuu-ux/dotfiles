return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function ()
        -- setting mason
        require('mason').setup()
        require('mason-lspconfig').setup {
            ensure_installed = {},
            automatic_enable = false,
        }

        -- setting lsp client
        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function (client, bufnr)
                if client.supports_method('textDocument/documentHighlight') then
                    local g = vim.api.nvim_create_augroup('LspDocHighlight_' .. bufnr, {})
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        group = g,
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        group = g,
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end
        })

        -- setting highlight
        vim.api.nvim_set_hl(0, "LspReferenceText",  { underline = true, fg = "#A00000", bg = "#104040" })
        vim.api.nvim_set_hl(0, "LspReferenceRead",  { underline = true, fg = "#A00000", bg = "#104040" })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, fg = "#A00000", bg = "#104040" })
        vim.lsp.enable({'clangd', 'pyright', 'ts_ls', 'lua_ls', 'gopls', 'html'})
    end
}

