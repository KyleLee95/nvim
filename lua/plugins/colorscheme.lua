--my own custom theme forked from lunarvim's darkplus:)
-- return {
-- 	"doums/darcula",
-- 	config = function()
-- 		vim.cmd("colorscheme darcula")
-- 	end,
-- }

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			terminal_colors = true,
-- 		})
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- }

return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vscode").setup({
			theme = "dark",
			transparent = true,
			italic = true,
		})

		vim.cmd([[colorscheme vscode]])
	end,
}
