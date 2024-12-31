return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("snippy").expand_snippet(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "snippy" },
        -- { name = "buffer" },
        -- { name = "path" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      experimental = {
        ghost_text = true,
      },
    })
  end,
}

