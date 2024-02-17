local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

--sets relative and absolute line numbers
set.nu = true
set.relativenumber = true
set.conceallevel = 1

vim.o.statuscolumn = "%s %l %r "
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
