return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
        local npairs = require("nvim-autopairs")
        npairs.setup({
            check_ts = true,
        })

        local Rule = require("nvim-autopairs.rule")
        npairs.add_rules({
            Rule("<", ">", "html"),
        })
        npairs.add_rules({
            Rule("<", ">", "htmldjango"),
        })
    end,
}
