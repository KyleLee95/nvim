return {

	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			ignore_filetypes = { markdown = true, c = true, cpp = true, cuda = true },
		})
	end,
}
