--my own custom theme forked from lunarvim's darkplus:)
-- return {
-- 	dir = "~/dev/darkplus.nvim/",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme darkplus")
-- 		--set background transparent
-- 		-- highlight Cursor gui=reverse guifg=NONE guibg=NONE
-- 		-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
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
	dir = "~/dev/colorschemes/",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme macro")

		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermbg = "NONE" })
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
	end,
}

-- return {
-- 	dir = "~/dev/base46-colors/",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme decay")
-- 	end,
-- }
