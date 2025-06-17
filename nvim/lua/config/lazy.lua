local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- spec = 'plugins',
    require('plugins/CopilotChat'),
    require('plugins/nvim-autopairs'),
    require('plugins/tokyonight'),
    require('plugins/telescope'),
    require('plugins/nvim-web-devicons'),
    require('plugins/lualine'),
    require('plugins/hlchunk'),
    require('plugins/neo-tree'),
    require('plugins/bufferline'),
    require('plugins/nvim-snippy'),
    require('plugins/nvim-cmp'),
    require('plugins/Comment'),
    require('plugins/toggleterm'),
    require('plugins/vim-fugitive'),
    require('plugins/gitsigns'),
    require('plugins/avante'),
    require('plugins/render_markdown'),
    -- require('plugins/lazydev'),
    require('plugins/rainbow-delimiters'),
    require('plugins/hop'),
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    require('plugins/nvim-lspconfig'),
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
})
