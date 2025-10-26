return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
        "lspcontainers/lspcontainers.nvim",
	},
	config = function()
		-- setting mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_enable = false,
		})

		-- setting lsp client
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/documentHighlight") then
					local g = vim.api.nvim_create_augroup("LspDocHighlight_" .. bufnr, {})
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = g,
						buffer = bufnr,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = g,
						buffer = bufnr,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

        vim.lsp.config.clangd = {
            cmd = require("lspcontainers").command("clangd", {
                image = 'webserv-dev',
                cmd_builder = function (runtime, volume, image)
                    return {
                        runtime,
                        "container",
                        "run",
                        "--rm",
                        "--interactive",
                        "--entrypoint",
                        "clangd",
                        "--volume",
                        volume,
                        image,
                    }
                end,
            }),
            root_markers = { '.git' },
        }

		-- setting highlight
		vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true, fg = "#A00000", bg = "#104040" })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true, fg = "#A00000", bg = "#104040" })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, fg = "#A00000", bg = "#104040" })
        vim.lsp.enable({ "clangd", "pyright", "ts_ls", "lua_ls", "gopls", "html", "nginx_language_server" })
	end,
}
