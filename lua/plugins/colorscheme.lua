--my own custom theme forked from lunarvim's darkplus:)

return {
	dir = "~/dev/dpp2.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme dpp")
		-- set background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#6e7681", bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#6e7681", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
	end,
}

-- return {
-- 	dir = "~/dev/dpp.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme dpp")
-- 		-- set background transparent
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#6e7681", bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#6e7681", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
-- 	end,
-- }
