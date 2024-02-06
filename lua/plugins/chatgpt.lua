return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "bw get item 'nvim_open_ai_key' | jq -r '.fields[]' | select(.name=='api_key').value",
			openai_params = {
				model = "gpt-4-0125-preview",
				max_tokens = 1024,
			},
			openai_edit_params = {
				model = "gpt-4-0125-preview",
				max_tokens = 1024,
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
