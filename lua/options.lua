local set = vim.opt
-- 1 tab = 4 spaces
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- sets relative and absolute line numbers
set.nu = true
set.relativenumber = true
vim.o.statuscolumn = "%s %l %r "

set.conceallevel = 1

-- spelling. See autocmds.lua for more
set.spelllang = "en_us"

-- ignore case in search
set.ignorecase = true
set.smartcase = true

vim.o.termguicolors = true
