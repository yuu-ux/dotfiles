-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"

require("config/options")
require("config/keymaps")
require("config/lazy")

-- Set colorscheme
vim.cmd("colorscheme onedark")

-- 保存時に末尾のスペースを削除する
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*", command = ":%s/\\s\\+$//e"})

---- ファイルタイプ ----
vim.api.nvim_command("autocmd BufNewFile,BufRead *.ddl,*.sql setfiletype sql")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.tt,*.inc setfiletype tt2html")

-- mason設定
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "pyright"}
}

require("lspconfig").pyright.setup {
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    end
}

-- 2. build-in LSP function
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- nvim-cmp設定
local cmp = require("cmp")
cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("snippy").expand_snippet(args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"} -- LSP補完ソースとしてnvim_lspを使用
                -- { name = "buffer" },
                -- { name = "path" },
            }
        ),
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-l>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm {select = true}
            }
        ),
        experimental = {
            ghost_text = true
        }
    }
)

-- LSPサーバーの設定 (clangdをnvim-lspconfigでセットアップ)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup {
    capabilities = capabilities
}

require("snippy").setup(
    {
        mappings = {
            is = {
                ["<Tab>"] = "expand_or_advance",
                ["<S-Tab>"] = "previous"
            }
        }
    }
)

-- hlchunk設定
require("hlchunk").setup(
    {
        chunk = {
            enable = true,
            style = "#806d9c",
            chars = {
                horizontal_line = "─",
                vertical_line = "│",
                left_top = "╭",
                left_bottom = "╰",
                right_arrow = ">"
            }
        },
        indent = {
            enable = true
        }
    }
)

require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"}
}

-- aerial設定
require("aerial").setup(
    {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
        end
    }
)

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
