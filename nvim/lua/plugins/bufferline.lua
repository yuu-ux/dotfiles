return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '<Tab>',
            ':bnext<CR>',
            mode = 'n',
            silent = true,
        },
        {
            '<S-Tab>',
            ':bprevious<CR>',
            mode = 'n',
            silent = true,
        },
        {
            '<F4>',
            ':b #<CR>',
            mode = 'n',
            silent = true,
        },
    },
    opts = {},
    init = function()
        vim.o.termguicolors = true
    end,
    lazy = false,
}
