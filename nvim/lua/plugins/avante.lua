return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
        provider = "copilot",
        auto_suggestions_provider = "copilot",
        windows = {
            position = "right",
            width = 30,
            sidebar_header = {
                align = "center",
                rounded = false,
            },
            ask = {
                floating = true,
                start_insert = true,
                border = "rounded",
            },
        },
    },
    build = "make",
    dependencies = {
        "stevearc/dressing.nvim",
        "MunifTanjim/nui.nvim",
    },
}
