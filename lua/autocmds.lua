-------------------------------------------------  General --------------------------------------
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-------------------------------------------------  CUDA files --------------------------------------
local commentGroup = vim.api.nvim_create_augroup("cuda_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.cu",
	group = commentGroup,
	callback = function()
		-- vim.opt_local.commentstring = "// %s" --for darwin
		vim.bo.commentstring = "// %s" -- for linux
	end,
})

-------------------------------------------------  Markdown files --------------------------------------
local markdownGroup = vim.api.nvim_create_augroup("markdown_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.md",
	group = markdownGroup,
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.md" },
	group = markdownGroup,
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 120
	end,
})

-- toggle concealing in md between insert and normal modes
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

------------------------------------------------latex setup------------------------------------------------

vim.api.nvim_create_augroup("latex_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.tex",
	group = "latex_settings",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = false
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
------------------------------------------------ Haskell setup ------------------------------------------------
--special settings for haskell because semantic white space languages are a PITA
vim.api.nvim_create_augroup("haskell_settings", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.hs" },
	group = "haskell_settings",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.hs" },
	group = "haskell_settings",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.hs",
	group = "haskell_settings",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- disable adding comment on new line
------------------------------------------------ LSP setup ------------------------------------------------------------------------------------
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

local StopNeovimDaemons = vim.api.nvim_create_augroup("StopNeovimDaemons", {})
vim.api.nvim_create_autocmd("ExitPre", {
	group = StopNeovimDaemons,
	callback = function()
		vim.fn.jobstart(vim.fn.expand("~/.local/bin/utils/stop_nvim_daemons.sh"), { detach = true })
	end,
})

------------------------------------------------ Wezterm Integrations. ------------------------------------------------

local weztermGroup = vim.api.nvim_create_augroup("wezterm", { clear = true })

--sets the tab name for wezterm integration.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = weztermGroup,
	pattern = "*.*",
	callback = function(event)
		local title = "nvim"
		if event.file ~= "" then
			title = string.format("nvim: %s", event.file)
			vim.fn.system({ "wezterm", "cli", "set-tab-title", title })
		end
	end,
})
