return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "lua", "vim", "query", "markdown", "markdown_inline", "go" },
        highlight = { enable = true },
    },
}
