-- text wrapping in md files
vim.api.nvim_create_augroup("markdown_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.md",
	group = "markdown_settings",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.md" },
	group = "markdown_settings",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.wrap = false
		vim.opt_local.linebreak = false
		vim.opt_local.textwidth = 120
	end,
})

-- toggle concealing in md
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

--latex setup

vim.api.nvim_create_augroup("latex_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.tex",
	group = "latex_settings",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.tex" },
	group = "latex_settings",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.wrap = false
		vim.opt_local.linebreak = false
		vim.opt_local.textwidth = 120
	end,
})

-- disable adding comment on new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
