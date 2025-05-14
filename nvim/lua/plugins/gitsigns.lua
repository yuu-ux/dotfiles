return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	-- :help ibl.config.scope とすると | などの一覧が表示される
	config = function()
		require("gitsigns").setup(
			{
				signs = {
					add = {text = "▌+"},
					change = {text = "▌~"},
					delete = {text = "▌_"},
					topdelete = {text = "▌‾"},
					changedelete = {text = "▌~"}
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl` coc-spell-checker とハイライトがぶつかる
				word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
				-- current_line_blame = true,
				attach_to_untracked = false,
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
					-- Navigation
					map(
						"n",
						"]c",
						function()
							if vim.wo.diff then
								return "]c"
							end
							vim.schedule(
								function()
									gs.next_hunk()
								end
							)
							return "<Ignore>"
						end,
						{expr = true, desc = "次のhunkへ移動"}
					)
					map(
						"n",
						"[c",
						function()
							if vim.wo.diff then
								return "[c"
							end
							vim.schedule(
								function()
									gs.prev_hunk()
								end
							)
							return "<Ignore>"
						end,
						{expr = true, desc = "前のhunkへ移動"}
					)
					-- 設定によっては行単位でstage することもできる
				end
			}
		)
		vim.api.nvim_set_hl(0, "GitSignsAddInline", { fg = nil, bg = "#5e8572", underline = false })
		vim.api.nvim_set_hl(0, "GitSignsChangeInline", { fg = nil, bg = "#5e8572", underline = false })
		vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { fg = nil, bg = "#5e8572", underline = false })
		-- require("scrollbar.handlers.gitsigns").setup()
		-- vim.api.nvim_create_autocmd("FileType", {
			--     pattern = "python",
			--     callback = function()
				--         vim.b.coc_root_patterns = { ".env" }
				--     end,
				-- })
				local switchGutterBranches = {
					"<input>",
					"HEAD",
					"origin/main",
					"origin/dev",
					"origin/master",
					"origin/staging",
					"main",
					"dev",
					"master",
					"staging"
				}
				vim.keymap.set("n", "m", ":lua SwitchGutter()<CR>", {noremap = true, silent = true})
				local isSwitchGutter = false
				function SwitchGutter()
					if isSwitchGutter then
						return
					end
					isSwitchGutter = true
					vim.ui.select(
						switchGutterBranches,
						{
							prompt = "Select the branch for comparison"
						},
						function(item, lnum)
							-- 手動入力
							if item == "<input>" then
								vim.ui.input(
									{prompt = "Enter the branch for comparison: "},
									function(input)
										package.loaded.gitsigns.change_base(input, true)
									end
								)
								isSwitchGutter = false
								return
							end
							if item and lnum then
								package.loaded.gitsigns.change_base(item, true)
							end
							isSwitchGutter = false
						end
					)
				end
			end
		}
