-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'

require('config/options')
require('config/keymaps')
require('config/lazy')

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'c', 'lua', 'vim', 'query', 'markdown', 'markdown_inline', 'go'}
}
