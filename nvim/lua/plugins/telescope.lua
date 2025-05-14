return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
        '<leader>b',
        ':Telescope buffers<CR>',
        silent = true,
        },
        {
        '<leader>ff',
        ':Telescope find_files<CR>',
        silent = true,
        },
        {
        '<leader>fg',
        ':Telescope live_grep<CR>',
        silent = true,
        },
        {
        '<leader>fb',
        ':Telescope file_browser<CR>',
        silent = true,
        },
        {
        '<leader>fh',
        function()
            require('telescope.builtin').help_tags()
        end,
        desc = 'Telescope help tags',
        },
        {
        'Q',
		':bdelete<CR>',
		mode = n,
		silent = true,
        },
    },
    opts = {
        pickers = {
            find_files = {
                theme = 'dropdown'
            }
        },
        extensions = {
            file_browser = {
                theme = 'ivy',
                hijack_netrw = true
            },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case'
            },
            aerial = {
                format_symbol = function(symbol_path, filetype)
                    if filetype == 'json' or filetype == 'yaml' then
                        return table.concat(symbol_path, '.')
                    else
                        return symbol_path[#symbol_path]
                    end
                end,
                show_columns = 'both'
            }
        }
    },
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('file_browser')
        telescope.load_extension('fzf')
        telescope.load_extension('aerial')
    end
}
