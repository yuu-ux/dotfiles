return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
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
            'Q',
            ':bdelete<CR>',
            mode = 'n',
            silent = true,
        },
    },
    opts = {},
}
