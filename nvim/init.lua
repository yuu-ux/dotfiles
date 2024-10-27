-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"
local g = vim.g

-- 無効にするビルトインプラグイン
g["loaded_2html_plugin"] = 1
g["loaded_compiler"] = 1
g["loaded_bugreport"] = 1
g["loaded_ftplugin"] = 1
g["loaded_getscript"] = 1
g["loaded_getscriptPlugin"] = 1
g["loaded_gzip"] = 1
g["loaded_logipat"] = 1
g["loaded_matchit"] = 1
g["loaded_netrw"] = 1
g["loaded_netrwPlugin"] = 1
g["loaded_netrwSettings"] = 1
g["loaded_netrwFileHandlers"] = 1
g["loaded_optwin"] = 1
g["loaded_rplugin"] = 1
g["loaded_rrhelper"] = 1
g["loaded_spellfile_plugin"] = 1
g["loaded_synmenu"] = 1
g["loaded_tar"] = 1
g["loaded_tarPlugin"] = 1
g["loaded_tutor"] = 1
g["loaded_vimball"] = 1
g["loaded_vimballPlugin"] = 1
g["loaded_zip"] = 1
g["loaded_zipPlugin"] = 1

-- Plugin management using vim-plug
vim.cmd(
    [[
    call plug#begin('~/.config/nvim/plugged')
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
        Plug 'nvim-lualine/lualine.nvim'
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'joshdick/onedark.vim'
        Plug 'neovim/nvim-lspconfig'
        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'dcampos/nvim-snippy'
        Plug 'shellRaining/hlchunk.nvim'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'stevearc/aerial.nvim'
        Plug 'nvim-telescope/telescope-file-browser.nvim'
    call plug#end()
]]
)

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Set colorscheme
vim.cmd("colorscheme onedark")

-- settings
vim.opt.mouse = "" -- マウスを無効にする
vim.opt.clipboard = "unnamedplus" -- システムクリップボードを使用する
vim.opt.swapfile = false -- スワップファイルを作らない
vim.opt.backup = false -- バックアップファイルを作らない
vim.opt.writebackup = false -- ファイル上書き前にバックアップを作成しない
vim.opt.undofile = false -- アンドゥファイルを作成しない
vim.opt.completeopt = {"menuone", "noinsert", "noselect"} -- 補完メニューを設定する

vim.opt.encoding = "utf-8" -- neovim 内の文字エンコーディングを指定する
vim.opt.fileencoding = "utf-8" -- デフォルトの文字コードを指定する
vim.opt.fileencodings = {"utf-8", "euc-jp", "sjis", "iso-2022-jp"} -- 文字コードの自動認識順序を指定する
vim.opt.fileformat = "unix" -- デフォルトの改行コードを指定する
vim.opt.fileformats = {"unix", "dos", "mac"} -- 改行コードの自動認識順序を指定する

vim.opt.showmode = false -- モードを非表示にする
vim.opt.showtabline = 0 -- タブラインの表示を指定する（「0」だと表示されない）
vim.opt.number = true -- 行番号を表示する
vim.opt.relativenumber = false -- 相対行番号表示を表示しない
vim.opt.numberwidth = 4 -- 行番号の桁数を指定する
vim.opt.showmatch = true -- 対応する括弧のハイライト表示する
vim.opt.foldmethod = "marker" -- 折り畳みのマーカーにデフォルトの「{{{」「}}}」を使用する
vim.opt.splitright = true -- 画面を縦分割する際に右に開く
vim.opt.splitbelow = true -- 画面を横分割する際に下に開く
vim.opt.linebreak = true -- 単語の分け目で改行する
vim.opt.termguicolors = true -- 24ビットRGBカラーを有効にする
vim.opt.laststatus = 2 -- 常にステータスラインを表示する
vim.opt.cmdheight = 2 -- コマンドラインの行数を指定する
vim.opt.list = true -- ホワイトスペースなどを表示する
vim.opt.listchars = {tab = ">.", trail = "_", extends = ">", precedes = "<"} -- 不可視文字の表示形式を指定する
vim.opt.cursorline = true -- カーソル行をハイライトする
vim.opt.conceallevel = 0 -- conceal 属性のテキストをどう表示するか指定する（「0」の場合、通常通り表示する）
vim.opt.signcolumn = "yes" -- 各種記号用カラムを常に表示（vim-gitgutterで未修正ファイルを変更した際のずれをなくすため）
vim.opt.winblend = 10 -- フローティングウィンドウの透明度を指定する（「0」の場合、非透明になる）
vim.opt.pumblend = 10 -- ポップアップメニューの透明度を指定する（「0」の場合、非透明になる）
vim.opt.scrolloff = 8 -- スクロール時にカーソル行上下に表示する行数を指定する
vim.opt.sidescrolloff = 8 -- 横スクロール時にカーソルの左右に表示する桁数を指定する
vim.opt.backspace = {"indent", "eol", "start"} -- バックスペースでインデントなどを消せるようにする
vim.opt.whichwrap = {b = true, s = true, h = true, l = true, ["<"] = true, [">"] = true, ["["] = true, ["]"] = true} -- 行頭や行末で左右に移動した際に行をまたいで移動ができるようにする

vim.opt.ignorecase = true -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true -- 検索時に大文字が含まれる場合のみ大文字小文字を区別する
vim.opt.hlsearch = true -- 前回の検索パターンが存在する場合にマッチするテキストを強調表示する

vim.opt.expandtab = true -- タブ入力を空白に変換する
vim.opt.shiftwidth = 4 -- 自動インデント時に入力する空白の数する
vim.opt.tabstop = 4 -- タブが返還される空白数を指定する
vim.opt.smartindent = true -- 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
vim.opt.hidden = true -- 未保存のファイルがある場合でも別ファイルを開くことができるようにする
vim.opt.history = 100 -- コマンド履歴の保存数を指定する
vim.opt.lazyredraw = false -- コマンド実行中は再描画しない
vim.opt.synmaxcol = 240 -- シンタックスハイライトする文字数を指定する
vim.opt.updatetime = 100 -- ms to wait for trigger an e

vim.opt.shortmess:append("c")

-- 保存時に末尾のスペースを削除する
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*", command = ":%s/\\s\\+$//e"})

---- ファイルタイプ ----
vim.api.nvim_command("autocmd BufNewFile,BufRead *.ddl,*.sql setfiletype sql")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.tt,*.inc setfiletype tt2html")

-- リーダーキー
g.mapleader = " "
g.maplocalleader = "\\"

-- リセット
vim.keymap.set("v", "nn", "<esc>")
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("", ";", "<Nop>", {noremap = true, silent = true, desc = "Disable ; key"})
vim.keymap.set("", "m", "<Nop>", {noremap = true, silent = true, desc = "Disable m key"})
vim.keymap.set("", ",", "<Nop>", {noremap = true, silent = true, desc = "Disable , key"})
vim.keymap.set("", "#", "<Nop>", {noremap = true, silent = true, desc = "Disable # key"})
vim.keymap.set("", "<Leader>n", "<Nop>", {noremap = true, silent = true, desc = "Disable <Leader>n key"})
vim.keymap.set("", "<Space>", "<Nop>", {noremap = true, silent = true, desc = "Disable <Space> key"})
vim.keymap.set("n", "Q", "", {noremap = true, silent = true, desc = "Disable Q key"})
vim.keymap.set("n", "nh", ":nohl<CR>", {noremap = true, silent = true, desc = "Clear search highlighting"})
vim.keymap.set("n", "d", '"_d', {noremap = true, silent = true})
vim.keymap.set("x", "d", '"_d', {noremap = true, silent = true})

-- インデント
vim.keymap.set("n", ">", ">>", {noremap = true, silent = true, desc = "Indent line to the right"})
vim.keymap.set("n", "<", "<<", {noremap = true, silent = true, desc = "Indent line to the left"})
vim.keymap.set(
    "x",
    ">",
    ">gv",
    {noremap = true, silent = true, desc = "Indent selected lines to the right and reselect"}
)
vim.keymap.set(
    "x",
    "<",
    "<gv",
    {noremap = true, silent = true, desc = "Indent selected lines to the left and reselect"}
)

-- talescope設定
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true
        },
        fzf = {
            fuzzy = true, -- false にすると完全一致での検索
            override_generic_sorter = true, -- デフォルトのジェネリックソーターを上書き
            override_file_sorter = true, -- デフォルトのファイルソーターを上書き
            case_mode = "smart_case" -- または "ignore_case" または "respect_case"
        },
        aerial = {
            format_symbol = function(symbol_path, filetype)
                if filetype == "json" or filetype == "yaml" then
                    return table.concat(symbol_path, ".")
                else
                    return symbol_path[#symbol_path]
                end
            end,
            -- Available modes: symbols, lines, both
            show_columns = "both"
        }
    }
}

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("aerial")

-- Telescope key mappings
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {silent = true})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {silent = true})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>fa",
    function()
        require("telescope").extensions.aerial.aerial()
    end,
    {silent = true}
)

-- ビジュアルモードで "p" に "_dP" をマッピング
vim.keymap.set("x", "p", '"_dP', {noremap = true, silent = true})

-- lualine設定
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "|", right = "|"},
        section_separators = {left = " ", right = " "},
        globalstatus = true
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ●", -- text to show when the file is modified.
                    readonly = " ", -- text to show when the file is non-modifiable or readonly.
                    unnamed = "[no name]" -- text to show for unnamed buffers.
                }
            }
        },
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    }
}

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
-- keyboard shortcut
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
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
