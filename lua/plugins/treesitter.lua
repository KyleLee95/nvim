return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	---type TSConfig
	---param opts TSConfig
	opts = {
		config = {
			cpp = { __default = "// %s", __multiline = "/* %s */" },
		},
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
		context_commentstring = { enable = true, enable_autocmd = false },
		ensure_installed = {
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"latex",
			"python",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
			"c",
			"cpp",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
