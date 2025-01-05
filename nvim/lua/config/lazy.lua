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
    require('plugins/aerial'),
    require('plugins/nvim-lspconfig'),
    require('plugins/nvim-snippy'),
    require('plugins/nvim-cmp'),
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'jesseduffield/lazygit' },
    { 'akinsho/toggleterm.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
})
