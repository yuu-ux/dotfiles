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
}

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or 'all' (the listed parsers MUST always be installed)
    ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline'}
}

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankSync", { clear = true }),
    pattern = "*",
    callback = function()
        vim.fn.setreg("+", vim.fn.getreg("@@"))
    end,
})
