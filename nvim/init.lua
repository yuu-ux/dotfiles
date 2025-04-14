-- 自動で読み込まれるものをオフにする・文字コード指定
vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'

require('config/options')
require('config/keymaps')
require('config/lazy')
vim.g.python3_host_prog = '/Users/yehara/.local/share/mise/installs/python/3.12.2/bin/python3'
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankSync", { clear = true }),
    pattern = "*",
    callback = function()
        vim.fn.setreg("+", vim.fn.getreg("@@"))
    end,
})
