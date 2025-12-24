return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
	},
	keys = {
		{
			"<leader>t",
			"<cmd>ToggleTerm<CR>",
			mode = "n",
			silent = true,
		},
	},
}
