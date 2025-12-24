return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = " ", right = " " },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = {
						modified = "●",
						readonly = " ",
						unnamed = "[no name]",
					},
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
