return {
    'stevearc/aerial.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        {
            '<leader>a',
            function()
                require('aerial').toggle()
            end,
            mode = 'n',
            silent = true,
            desc = 'Toggle Aerial',
        },
    },
    config = function()
        require('aerial').setup({
            on_attach = function(bufnr)
                vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
                vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
            end,
        })
    end,
}

