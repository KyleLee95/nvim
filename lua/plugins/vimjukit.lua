return {
	"luk400/vim-jukit",
	ft = { "py", "ipynb" },
	config = function()
		vim.g.jukit_highlight_markers = 1 -- Enable highlighting of Jukit markers
		vim.g.jukit_enable_textcell_bg_hl = 1 -- Enable background highlighting for text cells
		vim.g.jukit_enable_textcell_syntax = 1 -- Enable syntax highlighting for text cells
		vim.g.jukit_terminal = "tmux" -- Use tmux for terminal management
		vim.g.jukit_mappings_ext_enabled = { "py", "ipynb" } -- Disable Jukit mappings for non-Jukit files
	end,
}
