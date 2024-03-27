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

--------------------------------------- tmux integrations -------------------------------------
-- Define a table mapping filetypes to commands
local filetype_commands = {
	python = "python3 %; read",
	javascript = "node %; read",
	typescript = "ts-node %; read",
	haskell = "stack build && stack test; read",
	-- Add more filetypes and commands as needed
}

-- Function to get the command for the current filetype
local function get_tmux_command()
	local filetype = vim.bo.filetype
	local command = filetype_commands[filetype]
	if command then
		-- Get the directory of the current file
		local file_dir = vim.fn.expand("%:p:h")
		local output_split = file_dir .. "output"
		-- Change to the directory before executing the command
		return ":!tmux set-option -p history-limit 10000 \\; split-window -h 'cd "
			.. file_dir
			.. " && "
			.. command
			.. " && tmux rename-window "
			.. output_split
			.. "'<cr>"
	else
		return nil
	end
end

local function get_tmux_command()
	local filetype = vim.bo.filetype
	local command = filetype_commands[filetype]
	if command then
		-- Check if the current buffer is associated with a file
		local file_path = vim.fn.expand("%:p")
		if file_path == "" then
			vim.notify("No file associated with the current buffer.")
			return nil
		end

		-- Get the directory of the current file
		local file_dir = vim.fn.expand("%:p:h")
		-- Set a custom name for the split
		local split_name = "CustomName" -- Replace "CustomName" with your desired name

		-- Construct the tmux command
		local tmux_cmd = "tmux if-shell \"tmux list-panes -F '#W' | grep -q '^"
			.. split_name
			.. "$'\" \"select-window -t '"
			.. split_name
			.. "'\" \"set-option -p history-limit 10000 \\; split-window -h -c '"
			.. file_dir
			.. "' -n '"
			.. split_name
			.. "' \\; send-keys '"
			.. command
			.. "' C-m\""

		-- Return the command to be executed in Neovim
		return ":!" .. tmux_cmd .. "<cr>"
	else
		-- vim.notify("Command not found for filetype: " .. filetype, "echo ${pwd}")
		return nil
	end
end

-- Set the keymap using the dynamic command
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*", -- Run for all filetypes
	callback = function()
		local tmux_command = get_tmux_command()
		-- vim.notify(tmux_command)
		if tmux_command then
			vim.keymap.set("n", "<leader>rr", tmux_command, { silent = true, noremap = true })
		end
	end,
})

-- --disable plugins on big files
-- local function disable_plugins_for_large_files()
-- 	-- Set the threshold file size (e.g., 10 MB)
-- 	local threshold_size = 1024 * 1024 * 10
--
-- 	-- Get the size of the current file
-- 	local file_size = vim.fn.getfsize(vim.fn.expand("%:p"))
--
-- 	-- Check if the file size exceeds the threshold
-- 	if file_size > threshold_size then
-- 		-- Disable plugins as needed
-- 		-- For example, to disable a plugin like 'syntastic'
-- 		vim.g.syntastic_enable_checks = 0
-- 		-- Add similar lines for other plugins you want to disable
-- 	end
-- end
--
-- -- Set up the autocommand to run the function when opening a file
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = "*",
-- 	callback = disable_plugins_for_large_files,
-- })
