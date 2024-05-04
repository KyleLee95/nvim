--need to map leader at top so that other plugins don't interfere

vim.g.mapleader = ","

vim.keymap.set( "n" , "gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set( "n" , "<C-b>", ":Neotree toggle <Enter>")
vim.keymap.set( "n" , "<F12>", ":UndotreeToggle <Enter>")

--Splits
vim.keymap.set( "n" , "<leader>vs", ":vs <Enter>")
vim.keymap.set( "n" , "<leader>vh", ":split <Enter>")

--folke/trouble keymaps

--folke/trouble keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })


-- vimtex
vim.keymap.set( "n" , "<leader>vc", ":VimtexCompile <Enter>")
