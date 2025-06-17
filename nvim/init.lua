-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'

require('config/options')
require('config/keymaps')
require('config/lazy')

require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {},
    automatic_enable = false,
}

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'go'}
}
