local opt = vim.opt
local g = vim.g

-- リーダーキー
g.mapleader = " "
g.maplocalleader = "\\"
vim.g.copilot_enabled = false

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

-- settings
opt.mouse = "" -- マウスを無効にする
opt.clipboard = "unnamedplus" -- システムクリップボードを使用する
opt.swapfile = false -- スワップファイルを作らない
opt.backup = false -- バックアップファイルを作らない
opt.writebackup = false -- ファイル上書き前にバックアップを作成しない
opt.undofile = false -- アンドゥファイルを作成しない
opt.completeopt = {"menuone", "noinsert", "noselect"} -- 補完メニューを設定する

opt.encoding = "utf-8" -- neovim 内の文字エンコーディングを指定する
opt.fileencoding = "utf-8" -- デフォルトの文字コードを指定する
opt.fileencodings = {"utf-8", "euc-jp", "sjis", "iso-2022-jp"} -- 文字コードの自動認識順序を指定する
opt.fileformat = "unix" -- デフォルトの改行コードを指定する
opt.fileformats = {"unix", "dos", "mac"} -- 改行コードの自動認識順序を指定する

opt.showmode = false -- モードを非表示にする
opt.showtabline = 0 -- タブラインの表示を指定する（「0」だと表示されない）
opt.number = true -- 行番号を表示する
opt.relativenumber = false -- 相対行番号表示を表示しない
opt.numberwidth = 4 -- 行番号の桁数を指定する
opt.showmatch = true -- 対応する括弧のハイライト表示する
opt.foldmethod = "marker" -- 折り畳みのマーカーにデフォルトの「{{{」「}}}」を使用する
opt.splitright = true -- 画面を縦分割する際に右に開く
opt.splitbelow = true -- 画面を横分割する際に下に開く
opt.linebreak = true -- 単語の分け目で改行する
opt.termguicolors = true -- 24ビットRGBカラーを有効にする
opt.laststatus = 2 -- 常にステータスラインを表示する
opt.cmdheight = 2 -- コマンドラインの行数を指定する
opt.list = true -- ホワイトスペースなどを表示する
opt.listchars = {tab = ">.", trail = "_", extends = ">", precedes = "<"} -- 不可視文字の表示形式を指定する
opt.cursorline = true -- カーソル行をハイライトする
opt.conceallevel = 0 -- conceal 属性のテキストをどう表示するか指定する（「0」の場合、通常通り表示する）
opt.signcolumn = "yes" -- 各種記号用カラムを常に表示（vim-gitgutterで未修正ファイルを変更した際のずれをなくすため）
opt.winblend = 10 -- フローティングウィンドウの透明度を指定する（「0」の場合、非透明になる）
opt.pumblend = 10 -- ポップアップメニューの透明度を指定する（「0」の場合、非透明になる）
opt.scrolloff = 8 -- スクロール時にカーソル行上下に表示する行数を指定する
opt.sidescrolloff = 8 -- 横スクロール時にカーソルの左右に表示する桁数を指定する
opt.backspace = {"indent", "eol", "start"} -- バックスペースでインデントなどを消せるようにする
opt.whichwrap = {b = true, s = true, h = true, l = true, ["<"] = true, [">"] = true, ["["] = true, ["]"] = true} -- 行頭や行末で左右に移動した際に行をまたいで移動ができるようにする

opt.ignorecase = true -- 検索時に大文字小文字を区別しない
opt.fileignorecase = true
opt.smartcase = true -- 検索時に大文字が含まれる場合のみ大文字小文字を区別する
opt.hlsearch = true -- 前回の検索パターンが存在する場合にマッチするテキストを強調表示する

opt.expandtab = true -- タブ入力を空白に変換する
opt.shiftwidth = 4 -- 自動インデント時に入力する空白の数する
opt.tabstop = 4 -- タブが返還される空白数を指定する
opt.smartindent = true -- 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
opt.hidden = true -- 未保存のファイルがある場合でも別ファイルを開くことができるようにする
opt.history = 100 -- コマンド履歴の保存数を指定する
opt.lazyredraw = false -- コマンド実行中は再描画しない
opt.synmaxcol = 240 -- シンタックスハイライトする文字数を指定する
opt.updatetime = 100 -- ms to wait for trigger an e

opt.shortmess:append("c")

-- 保存時に末尾のスペースを削除する
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    command = ':%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
})
---- ファイルタイプ ----
vim.api.nvim_command('autocmd BufNewFile,BufRead *.ddl,*.sql setfiletype sql')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.tt,*.inc setfiletype tt2html')
