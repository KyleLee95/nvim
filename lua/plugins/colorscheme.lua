return {
	"Mofiqul/vscode.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("vscode").setup({
			transparent = true,
		})

		vim.cmd("colorscheme vscode")
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000", ctermbg = "NONE" })
	end,
}
