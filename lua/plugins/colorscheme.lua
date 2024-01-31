-- my own custom theme forked from lunarvim's darkplus:)
return {
	dir = "~/dev/darkplus.nvim/",
	lazy = false,
	priority = 1000,
	config = function()
		-- local group = vim.api.nvim_create_augroup("user_colors", { clear = true })
		-- vim.api.nvim_create_autocmd("ColorScheme", {
		-- 	group = group,
		-- 	pattern = "*",
		-- 	command = "highlight Normal ctermbg=NONE guibg=NONE highlight Background ctermbg=NONE guibg=NONE",
		-- })
		vim.cmd("colorscheme darkplus")
		--set background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
		-- vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
		-- TelescopeBorderxxx guifg=#6e7681 guibg=#1e1e1e
		-- guifg=#6e7681
		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#6e7681", bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#6e7681", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#0f0f0f", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		-- vim.cmd("hi Terminal guibg=NONE ctermbg=NONE")
		-- vim.api.nvim_create_augroup("nobg", { clear = true })
		-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		-- 	desc = "Make all backgrounds transparent",
		-- 	group = "nobg",
		-- 	pattern = "*",
		-- 	callback = function()
		-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		-- 		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
		-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		-- 		-- etc...
		-- 	end,
		-- })
	end,
}
-- return {
-- 	"LunarVim/darkplus.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme darkplus")
-- 	end,
-- }
-- return {
-- 	"rockyzhang24/arctic.nvim",
-- 	dependencies = { "rktjmp/lush.nvim" },
-- 	name = "arctic",
-- 	branch = "main",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme arctic")
-- 	end,
-- }
--
-- Lua:
-- For dark theme (neovim's default)
-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	config = function()
-- 		-- vim.o.background = "dark"
-- 		-- For light theme
-- 		-- vim.o.background = "light"
--
-- 		local c = require("vscode.colors").get_colors()
-- 		require("vscode").setup({
-- 			-- Alternatively set style in setup
-- 			-- style = 'light'
--
-- 			-- Enable transparent background
-- 			-- transparent = true,
--
-- 			-- Enable italic comment
-- 			italic_comments = true,
--
-- 			-- Disable nvim-tree background color
-- 			disable_nvimtree_bg = true,
--
-- 			-- Override colors (see ./lua/vscode/colors.lua)
-- 			color_overrides = {
-- 				vscLineNumber = "#FFFFFF",
-- 			},
--
-- 			-- Override highlight groups (see ./lua/vscode/theme.lua)
-- 			group_overrides = {
-- 				-- this supports the same val table as vim.api.nvim_set_hl
-- 				-- use colors from this colorscheme by requiring vscode.colors!
-- 				-- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
-- 			},
-- 		})
-- 		require("vscode").load()
-- 	end,
-- }
-- return {
-- 	'nyoom-engineering/oxocarbon.nvim',
-- 	config=function()
-- 		vim.opt.background = "dark" -- set this to dark or light
-- 		vim.cmd.colorscheme "oxocarbon"
-- 	end
-- }
