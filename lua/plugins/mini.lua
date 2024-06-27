return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
		local surround = require("mini.surround")
		surround.setup({})
		local align = require("mini.align")
		align.setup({})
		-- local comment = require("mini.comment")
		-- comment.setup({
		-- 	options = {
		-- 		-- Function to compute custom 'commentstring' (optional)
		-- 		custom_commentstring = nil,
		--
		-- 		-- Whether to ignore blank lines when commenting
		-- 		ignore_blank_line = false,
		--
		-- 		-- Whether to recognize as comment only lines without indent
		-- 		start_of_line = false,
		--
		-- 		-- Whether to force single space inner padding for comment parts
		-- 		pad_comment_parts = true,
		-- 	},
		-- })
	end,
}
