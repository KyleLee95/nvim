-- text wrapping in md files
vim.api.nvim_create_augroup("markdown_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.md",
	group = "markdown_settings",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.md" },
	group = "markdown_settings",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.wrap = false
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
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.tex" },
	group = "latex_settings",
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.wrap = false
		vim.opt_local.textwidth = 120
	end,
})

-- disable adding comment on new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

local augroup = vim.api.nvim_create_augroup
local LSPGroup = augroup("LSPGroup", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
	group = LSPGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = LSPGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})
