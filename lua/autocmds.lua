local M = {}

-------------------------------------------------  General ----------------------------------------
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-------------------------------------------------  CUDA files --------------------------------------
local commentGroup = vim.api.nvim_create_augroup("cuda_settings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.cu",
	group = commentGroup,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.commentstring = "// %s"
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*.cu",
	group = commentGroup,
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.commentstring = ""
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

local filetype_commands = {
	python = "python3 %; zsh",
	javascript = "node %; zsh",
	typescript = "ts-node %; zsh",
	haskell = "stack build && stack test; zsh",
	lua = "lua %; zsh",
	-- Add more filetypes and commands as needed
}

local function get_ft_command(filetype)
	local command = filetype_commands[filetype]
	local buffer_name = vim.fn.expand("%")
	local full_command_str = command:gsub("%%", buffer_name)
	return full_command_str
end

local function create_wezterm_splitpane()
	local id = vim.system({ "wezterm", "cli", "split-pane", "--right", "--percent", "40" }, { text = true }, function(p)
		if p.code ~= 0 then
			vim.notify("Failed to create a split pane. \n" .. p.stderr, vim.logs.levels.ERROR, { title = "Wezterm" })
		end
	end):wait()

	local stripped_id = string.gsub(id.stdout, "%s+", "")
	return stripped_id
end

local function send_text_to_wezterm(pane_id, full_command_str)
	vim.system(
		{ "wezterm", "cli", "send-text", "--pane-id", pane_id, full_command_str .. "\n" },
		{ text = true },
		function(p)
			if p.code ~= 0 then
				vim.notify(
					"Failed to move to send text to pane:" .. pane_id .. "\n" .. p.stderr,
					vim.log.levels.ERROR,
					{ title = "Wezterm" }
				)
			end
		end
	)
end

local function create_repl_pane(ft_command)
	return function()
		local repl_pane_id = create_wezterm_splitpane()
		if repl_pane_id == nil then
			vim.notify("repl_pane_id is nil " .. repl_pane_id)
		end
		send_text_to_wezterm(repl_pane_id, ft_command)
	end
end
-- Autocommand to set up the keymap for filetypes with Wezterm
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype_commands[filetype] then
			local ft_command = get_ft_command(filetype)
			vim.keymap.set("n", "<leader>rr", create_repl_pane(ft_command), { silent = true, noremap = true })
		end
	end,
})
