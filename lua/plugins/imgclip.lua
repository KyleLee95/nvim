return {
	"HakonHarnes/img-clip.nvim",
	event = "BufEnter",
	opts = {
		default = {
			debug = false, -- enable debug mode
			dir_path = "assets/imgs", -- directory path to save images to, can be relative (cwd or current file) or absolute
			file_name = "%Y-%m-%d-%H-%M-%S", -- file name format (see lua.org/pil/22.1.html)
			url_encode_path = false, -- encode spaces and special characters in file path
			use_absolute_path = false, -- expands dir_path to an absolute path
			relative_to_current_file = true, -- make dir_path relative to current file rather than the cwd
			relative_template_path = true, -- make file path in the template relative to current file rather than the cwd
			prompt_for_file_name = true, -- ask user for file name before saving, leave empty to use default
			show_dir_path_in_prompt = true, -- show dir_path in prompt when prompting for file name
			use_cursor_in_template = true, -- jump to cursor position in template after pasting
			insert_mode_after_paste = true, -- enter insert mode after pasting the markup code
			embed_image_as_base64 = false, -- paste image as base64 string instead of saving to file
			max_base64_size = 10, -- max size of base64 string in KB
			template = "$FILE_PATH", -- default template

			drag_and_drop = {
				enabled = true, -- enable drag and drop mode
				insert_mode = false, -- enable drag and drop in insert mode
				copy_images = true, -- copy images instead of using the original file
				download_images = true, -- download images and save them to dir_path instead of using the URL
			},
		},

		-- filetype specific options
		-- any options that are passed here will override the default config
		-- for instance, setting use_absolute_path = true for markdown will
		-- only enable that for this particular filetype
		-- the key (e.g. "markdown") is the filetype (output of "set filetype?")
		filetypes = {
			markdown = {
				url_encode_path = true,
				template = "![$CURSOR]($FILE_PATH)",

				drag_and_drop = {
					download_images = true,
				},
			},

			html = {
				template = '<img src="$FILE_PATH" alt="$CURSOR">',
			},

			tex = {
				relative_template_path = false,
				template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
    ]],
			},

			typst = {
				template = [[
#figure(
  image("$FILE_PATH", width: 80%),
  caption: [$CURSOR],
) <fig-$LABEL>
    ]],
			},

			rst = {
				template = [[
.. image:: $FILE_PATH
   :alt: $CURSOR
   :width: 80%
    ]],
			},

			asciidoc = {
				template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]',
			},

			org = {
				template = [=[
#+BEGIN_FIGURE
[[file:$FILE_PATH]]
#+CAPTION: $CURSOR
#+NAME: fig:$LABEL
#+END_FIGURE
    ]=],
			},
		},

		-- override options for specific files, dirs or custom triggers
		files = {}, -- file specific options (e.g. "main.md" or "/path/to/main.md")
		dirs = {}, -- dir specific options (e.g. "project" or "/home/user/project")
		custom = {}, -- custom options enabled with the trigger option
	},
	keys = {
		-- suggested keymap
		-- { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
	},
}
