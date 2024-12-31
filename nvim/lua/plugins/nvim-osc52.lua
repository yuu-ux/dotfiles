return {
    'ojroques/nvim-osc52',
    keys = {
        {
            'y',
            mode = 'n',
            expr = true,
            function ()
                return require('osc52').copy_operator()
            end,
        }
    }
}
