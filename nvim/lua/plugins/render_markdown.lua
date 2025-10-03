return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		-- Whether markdown should be rendered by default.
		enabled = true,
		render_modes = { "n", "c", "t" },
		file_types = { "markdown" },
		heading = {
			width = "block",
			left_pad = 0,
			right_pad = 4,
			icons = {},
		},
		horizontal_rule = {
			char = "─",
			repeat_char = true,
			highlight = "Comment",
		},
		checkbox = {
			-- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'.
			-- There are two special states for unchecked & checked defined in the markdown grammar.

			-- Turn on / off checkbox state rendering.
			enabled = true,
			-- Additional modes to render checkboxes.
			render_modes = false,
			-- Render the bullet point before the checkbox.
			bullet = false,
			-- Padding to add to the right of checkboxes.
			right_pad = 1,
			unchecked = {
				-- Replaces '[ ]' of 'task_list_marker_unchecked'.
				icon = "",
				-- Highlight for the unchecked icon.
				highlight = "RenderMarkdownUnchecked",
				-- Highlight for item associated with unchecked checkbox.
				scope_highlight = nil,
			},
			checked = {
				-- Replaces '[ ]' of 'task_list_marker_unchecked'.
				icon = "",
				-- Highlight for the unchecked icon.
				highlight = "RenderMarkdownUnchecked",
				-- Highlight for item associated with unchecked checkbox.
				scope_highlight = nil,
			},
			-- Define custom checkbox states, more involved, not part of the markdown grammar.
			-- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks.
			-- The key is for healthcheck and to allow users to change its values, value type below.
			-- | raw             | matched against the raw text of a 'shortcut_link'           |
			-- | rendered        | replaces the 'raw' value when rendering                     |
			-- | highlight       | highlight for the 'rendered' icon                           |
			-- | scope_highlight | optional highlight for item associated with custom checkbox |
			-- stylua: ignore
		},
	},
}
