local keymap = vim.keymap

-- リセット
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "j", "gj")
keymap.set("v", "k", "gk")
keymap.set("v", "nn", "<esc>")
keymap.set("i", "jj", "<esc>")
keymap.set("n", "J", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "K", ":m .-2<CR>==", { noremap = true, silent = true })
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-j>", "<Down>")
-- ビジュアルモード
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap.set("", ";", "<Nop>", { noremap = true, silent = true, desc = "Disable ; key" })
keymap.set("", "m", "<Nop>", { noremap = true, silent = true, desc = "Disable m key" })
keymap.set("", ",", "<Nop>", { noremap = true, silent = true, desc = "Disable , key" })
keymap.set("", "#", "<Nop>", { noremap = true, silent = true, desc = "Disable # key" })
keymap.set("", "<Leader>n", "<Nop>", { noremap = true, silent = true, desc = "Disable <Leader>n key" })
keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true, desc = "Disable <Space> key" })
keymap.set("n", "Q", "", { noremap = true, silent = true, desc = "Disable Q key" })
keymap.set("n", "<Esc>", ":nohl<CR>", { noremap = true, silent = true, desc = "Clear search highlighting" })
keymap.set("n", "d", '"_d', { noremap = true, silent = true })
keymap.set("x", "d", '"_d', { noremap = true, silent = true })

-- インデント
keymap.set("n", ">", ">>", { noremap = true, silent = true, desc = "Indent line to the right" })
keymap.set("n", "<", "<<", { noremap = true, silent = true, desc = "Indent line to the left" })
keymap.set("x", ">", ">gv", { noremap = true, silent = true, desc = "Indent selected lines to the right and reselect" })
keymap.set("x", "<", "<gv", { noremap = true, silent = true, desc = "Indent selected lines to the left and reselect" })

keymap.set("n", "<leader>fa", function()
	require("telescope").extensions.aerial.aerial()
end, { silent = true })

-- ビジュアルモードで "p" に "_dP" をマッピング
keymap.set("x", "p", '"_dP', { noremap = true, silent = true })

-- lsp key mappings
keymap.set("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
