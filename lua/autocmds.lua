vim.api.nvim_create_augroup("markdown_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = "markdown_settings",
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.textwidth = 0
		vim.opt_local.wrapmargin = 0
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.columns = 80
	end,
})

vim.api.nvim_create_augroup("markdown_conceal", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*.md",
  group = "markdown_conceal",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.md",
  group = "markdown_conceal",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
