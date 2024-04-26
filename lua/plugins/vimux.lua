local filetype_commands = {
	python = "python3 %; zsh",
	javascript = "node %; zsh",
	typescript = "ts-node %; zsh",
	haskell = "stack build && stack test; zsh",
	lua = "lua %; zsh",
	-- Add more filetypes and commands as needed
}

-- Function to get the Vimux command for a given filetype
local function get_vimux_command(filetype)
	-- local command = filetype_commands[filetype]
	-- return ":VimuxRunCommand('" .. command .. " . bufname("%")')<cr>"
	local command = filetype_commands[filetype]
	local buffer_name = vim.fn.expand("%") -- Get the name of the current buffer
	print("buffer name", buffer_name)
	return ":VimuxRunCommand('" .. command:gsub("%%", buffer_name) .. "')<cr>"
end

-- Autocommand to set up the keymap for filetypes with Vimux commands
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype_commands[filetype] then
			local vimux_command = get_vimux_command(filetype)
			vim.keymap.set("n", "<leader>rr", vimux_command, { silent = true, noremap = true })
		end
	end,
})
return {
	"preservim/vimux",
	config = function()
		vim.g.VimuxOrientation = "h"
		vim.g.VimuxRunnerName = "vimuxout"
	end,
}
