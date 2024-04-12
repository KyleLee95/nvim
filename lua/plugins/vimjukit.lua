return {
	"luk400/vim-jukit",
	ft = {"ipynb", "py"},
	config = function()
		vim.g.jukit_highlight_markers = 1
		vim.g.jukit_enable_textcell_bg_hl = 1
		vim.g.jukit_enable_textcell_syntax = 1
		vim.g.jukit_terminal = "tmux"
		-- vim.g.jukit_mappings_ext_enable = { "py", "ipynb" }
	end,
}
