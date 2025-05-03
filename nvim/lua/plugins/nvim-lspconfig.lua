return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',  -- 依存関係を明示
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local doc_highlight = vim.api.nvim_create_augroup("__doc_highlight", {})
        local servers = {
            clangd = {},
            pyright = {},
            ts_ls = {},
            lua_ls = {},
			gopls = {},
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            config.on_attach = function(client, bufnr)
                print("Attached to: " .. client.name)
                -- ドキュメントハイライトの設定
                vim.opt.updatetime = 1000
                if client.supports_method("textDocument/documentHighlight") then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        group = doc_highlight,
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        group = doc_highlight,
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end
            lspconfig[server].setup(config)
        end

        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            { virtual_text = false }
        )

        vim.cmd [[
        highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
        highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
        highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
        ]]
    end,
}

