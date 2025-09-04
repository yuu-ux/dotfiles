return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    keys = {
        {
            '<C-n>',
            ':bnext<CR>',
            mode = 'n',
            silent = true,
        },
        {
            '<C-p>',
            ':bprevious<CR>',
            mode = 'n',
            silent = true,
        },
        {
            'Q',
            ':bdelete<CR>',
            mode = 'n',
            silent = true,
        },
    },
    opts = {},
}
