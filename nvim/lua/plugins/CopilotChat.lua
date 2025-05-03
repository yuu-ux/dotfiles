return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
	opts = {
		model = "claude-3.7-sonnet", -- モデル名を指定
	},
    build = 'make tiktoken',
    config = function ()
        require('CopilotChat').setup({
        show_help = 'yes',
        prompts = {
            Commit = {
                prompt = 'Describe the commit message for the staged change in Japanese. Select a prefix for this change from the commit template and use the :<prefix>: format.',
                mapping = '<leader>c',
                description = 'ステージ済みのコミットメッセージの作成をお願いする',
            },
        },
    })
    end,
}
