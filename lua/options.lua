local set = vim.opt
-- 1 tab = 4 spaces
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- sets relative and absolute line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s %l %r "

-- handles markdown rendering for things like code blocks, bullets, etc.
set.conceallevel = 1

-- spelling. See autocmds.lua for more
set.spelllang = "en_us"

-- ignore case in search
set.ignorecase = true
set.smartcase = true

-- use ripgrep for grepping
vim.opt.grepprg = "rg --smartcase --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- terminal colors
vim.o.termguicolors = true
