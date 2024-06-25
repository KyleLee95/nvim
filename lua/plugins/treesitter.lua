return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("ts_context_commentstring").setup({})
	end,
}
