-- talescope設定
local actions = require("telescope.actions")

require("telescope").setup {
    pickers = {
        find_files = {
            theme = "dropdown"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        aerial = {
            format_symbol = function(symbol_path, filetype)
                if filetype == "json" or filetype == "yaml" then
                    return table.concat(symbol_path, ".")
                else
                    return symbol_path[#symbol_path]
                end
            end,
            show_columns = "both"
        }
    }
}

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("aerial")
