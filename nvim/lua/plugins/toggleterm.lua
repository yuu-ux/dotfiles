return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = 'float',
    },
    keys = {
        {
            '<leader>t',
            ':ToggleTerm<CR>',
            mode = n,
            silent = true,
        },
    }
}

