return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function(_, opts)
    local hop = require('hop')
    hop.setup(opts)

    vim.keymap.set('', 'f', function()
      vim.cmd('HopWord')
    end, { remap = true })

    vim.keymap.set('', 'F', function()
      vim.cmd('HopPattern')
    end, { remap = true })
    end
}
