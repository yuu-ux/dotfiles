return {
    "neoclide/coc.nvim",
    -- 最新版だとcoc-tsserverが動かない
    branch = "release",
    -- commit = "fab97c7db68f24e5cc3c1cf753d3bd1819beef8f",
    build = "yarn install --frozen-lockfile",
    lazy = false,
    init = function()
        local node_path = "~/.local/share/mise/installs/node/18.16.0/bin/node"
        -- vim.g.coc_node_path = node_path
        -- インストール時実行
        -- call coc#util#install()
        -- coc-snippets を使用する場合は以下実行
        -- pip install pynvim
        -- 定義ジャンプ
        vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
        -- 型定義ジャンプ
        vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
        -- grep
        vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
        -- 情報表示
        function CocShowDocumentation()
            if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
                vim.cmd('execute "h " . expand("<cword>")')
            elseif vim.fn["coc#rpc#ready"]() then
                vim.fn.CocActionAsync("doHover")
            else
                vim.cmd('execute "!" . &keywordprg . " " . expand("<cword>")')
            end
        end
        vim.keymap.set("n", "H", ":lua CocShowDocumentation()<CR>", { silent = true })
        -- コードアクション(全て)
        vim.keymap.set("n", "cc", "<Plug>(coc-codeaction)", { silent = true })
        -- コードアクション(特定操作)
        vim.keymap.set("x", "cd", "<Plug>(coc-codeaction-selected)", { silent = true })
        vim.keymap.set("n", "cd", "<Plug>(coc-codeaction-selected)", { silent = true })
        -- 現在の行の問題にAutoFixを適用する
        vim.keymap.set("n", "cq", "<Plug>(coc-fix-current)", { silent = true })
        -- 選択したコードをフォーマットする
        vim.keymap.set("x", "cf", "<Plug>(coc-format-selected)", { silent = true })
        vim.keymap.set("n", "cf", "<Plug>(coc-format-selected)", { silent = true })
        -- :Format
        vim.api.nvim_create_user_command("Format", "call CocAction('format')", { nargs = 0 })
        -- :FormatImportでインポートの整理（不要なインポートの削除、並べ替えなど）
        vim.api.nvim_create_user_command(
            "FormatImport",
            "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
            { nargs = 0 }
        )
        -- すべての診断情報を表示
        vim.keymap.set("n", "dg", ":CocList diagnostics<CR>", { silent = true })
        -- [dと]dを使用して診断情報をナビゲート
        vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
        vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })

        -- pythonなど、見えにくいので調整
        vim.api.nvim_set_hl(0, "CocInlayHint", { fg = "lightgray", bg = "darkcyan" })
        vim.api.nvim_set_hl(0, "CocInlayHintType", { fg = "lightgray", bg = "darkcyan" })
        vim.api.nvim_set_hl(0, "CocInlayHintParameter", { fg = "lightgray", bg = "darkcyan" })
    end
}
