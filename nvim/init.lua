-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'

require('config/options')
require('config/keymaps')
require('config/lazy')

-- mason設定
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {'lua_ls', 'pyright'}
require('function_lines_counter').setup()
