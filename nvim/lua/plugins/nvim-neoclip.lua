return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'kkharji/sqlite.lua',
  },
  config = function()
    require('neoclip').setup({
      enable_persistent_history = true,
      history = 1000,
      continuous_sync = true,
      keys = {
        telescope = {
          i = {
            paste = '<CR>',
            paste_behind = '<C-k>',
            replay = '<C-q>',
            delete = '<C-d>',
          },
          n = {
            paste = '<CR>',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
          },
        },
      },
    })

    require('telescope').load_extension('neoclip')

    vim.keymap.set('n', '<leader>y', '<cmd>Telescope neoclip<CR>', {
      noremap = true,
      silent = true,
    })
  end,
}
