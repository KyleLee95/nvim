--need to map leader at top so that other plugins don't interfere

vim.g.mapleader = ","
vim.g.maplocalleader = "."

local function map(mode, lhs, rhs)
	local options = { noremap = false, silent = true, nowait = true }
	vim.keymap.set(mode, lhs, rhs, options)
end
map({ "i", "n", "v" }, "gd", "<cmd>Telescope lsp_definitions<cr>")
map({ "i", "n", "v" }, "<C-b>", ":Neotree toggle <Enter>")
map({ "i", "n", "v" }, "<F12>", ":UndotreeToggle <Enter>")

--Splits
map({ "i", "n", "v" }, "<leader>vs", ":vs <Enter>")
map({ "i", "n", "v" }, "<leader>vh", ":split <Enter>")

--folke/trouble keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

--chatGPT
map({ "n", "n", "v" }, "<leader>cg", "<cmd>ChatGPT<cr>")
map({ "n", "n", "v" }, "<leader>cge", "<cmd>ChatGPTRun explain_code<cr>")

-- vimtex
map({ "i", "n", "v" }, "<leader>vc", ":VimtexCompile <Enter>")

vim.api.nvim_set_keymap("i", "<C-p>", "()<Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-o>", "{}<Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-\\>", "[]<Esc>i", { noremap = true })
