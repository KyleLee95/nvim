-- default config
return {
	"3rd/image.nvim",
	lazy = true,
	config = function()
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
		require("image").setup({
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown" }, -- markdown extensions (ie. quarto) can go here
					resolve_image_path = function(document_path, image_path, fallback)
						-- document_path is the path to the file that contains the image
						-- image_path is the potentially relative path to the image. for
						-- markdown it's `![](this text)`
						-- you can call the fallback function to get the default behavior

						return fallback(document_path, image_path)
					end,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
		})
	end,
}
