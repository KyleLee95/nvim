local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- sets relative and absolute line numbers
set.nu = true
set.relativenumber = true
set.conceallevel = 1
-- spelling. See autocmds.lua for more
set.spelllang = "en_us"
-- ignoring case in search
set.ignorecase = true
set.smartcase = true

vim.o.statuscolumn = "%s %l %r "
-- vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
