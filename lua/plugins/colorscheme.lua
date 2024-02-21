--my own custom theme forked from lunarvim's darkplus:)
-- return {
-- 	dir = "~/dev/darkplus.nvim/",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme darkplus")
-- 		--set background transparent
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#6e7681", bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#6e7681", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#0f0f0f", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 	end,
-- }

return {
	dir = "~/dev/base46-colors/",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme chadtain")
	end,
}
-- return {
-- 	"miikanissi/modus-themes.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.o.background = "dark"
-- 		vim.cmd("colorscheme modus")
-- 		-- Default options
-- 		require("modus-themes").setup({
-- 			-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
-- 			-- `auto` will automatically set style based on background set with vim.o.background
-- 			style = "auto",
-- 			variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
-- 			transparent = true, -- Transparent background (as supported by the terminal)
-- 			dim_inactive = false, -- "non-current" windows are dimmed
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = {},
-- 				variables = {},
-- 			},
--
-- 			--- You can override specific color groups to use other groups or a hex color
-- 			--- function will be called with a ColorScheme table
-- 			---@param colors ColorScheme
-- 			on_colors = function(colors) end,
--
-- 			--- You can override specific highlights to use other groups or a hex color
-- 			--- function will be called with a Highlights and ColorScheme table
-- 			---@param highlights Highlights
-- 			---@param colors ColorScheme
-- 			on_highlights = function(highlights, colors) end,
-- 		})
-- 	end,
-- }
-- return {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require 'nordic'.load()
--     end
-- }
-- return {
-- 	"pradyungn/Mountain",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
--
-- 		vim.cmd("colorscheme mountain")
-- 	end,
-- }
