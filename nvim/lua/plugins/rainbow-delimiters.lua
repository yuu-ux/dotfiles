return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = require('rainbow-delimiters').strategy['global'],
        lua = require('rainbow-delimiters').strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end
}
