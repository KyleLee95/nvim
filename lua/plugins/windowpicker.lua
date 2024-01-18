return {
	"s1n7ax/nvim-window-picker",
	version = "2.*",
	config = function()
		require("window-picker").setup({
			filter_rules = {
				include_current_win = false,
				autoselect_one = true,
				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					-- if the buffer type is one of following, the window will be ignored
					buftype = { "terminal", "quickfix" },
				},
			},
			highlights = {
				statusline = {
					focused = {
						fg = "#ededed",
						bg = "#e35e4f",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#44cc41",
						bold = true,
					},
				},
				winbar = {
					focused = {
						fg = "#ededed",
						bg = "#e35e4f",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#44cc41",
						bold = true,
					},
				},
			},
		})
	end,
}
