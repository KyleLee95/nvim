return {
	"vonheikemen/lsp-zero.nvim",
	dependencies = {
		-- lsp support
		{ "neovim/nvim-lspconfig" }, -- required
		{ "williamboman/mason.nvim" }, -- optional
		{ "williamboman/mason-lspconfig.nvim" }, -- optional

		-- autocompletion
		{ "hrsh7th/nvim-cmp" }, -- required
		{ "hrsh7th/cmp-nvim-lsp" }, -- required
		{ "hrsh7th/cmp-buffer" }, -- optional
		{ "hrsh7th/cmp-path" }, -- optional
		{ "saadparwaiz1/cmp_luasnip" }, -- optional
		{ "hrsh7th/cmp-nvim-lua" }, -- optional
		-- snippets
		{ "l3mon4d3/luasnip" }, -- required
		{ "rafamadriz/friendly-snippets" }, -- optional
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp_action = lsp_zero.cmp_action()

		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })

		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "LspDiagnosticsDefaultWarning" })

		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "LspDiagnosticsDefaultInformation" })

		vim.fn.sign_define("DiagnosticSignHint", { text = "󱧢", texthl = "LspDiagnosticsDefaultHint" })
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = true,
		})
		vim.o.updatetime = 250
		vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "lua_ls" },
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.select }
		return cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "spell" },
			},
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				["<C-a>"] = cmp_action.toggle_completion(),
				["<Tab>"] = cmp_action.tab_complete(),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
		})
	end,
}

------- ********************* MINIMAL SET UP FOR DEBUG ***************** -------------
-- return {
-- 	"vonheikemen/lsp-zero.nvim",
-- 	dependencies = {
-- 		-- lsp support
-- 		{ "neovim/nvim-lspconfig" }, -- required
-- 		{ "williamboman/mason.nvim" }, -- optional
-- 		{ "williamboman/mason-lspconfig.nvim" }, -- optional
--
-- 		-- autocompletion
-- 		{ "hrsh7th/nvim-cmp" }, -- required
-- 		{ "hrsh7th/cmp-nvim-lsp" }, -- required
-- 		{ "hrsh7th/cmp-buffer" }, -- optional
-- 		{ "hrsh7th/cmp-path" }, -- optional
-- 		{ "saadparwaiz1/cmp_luasnip" }, -- optional
-- 		{ "hrsh7th/cmp-nvim-lua" }, -- optional
--
-- 		-- snippets
-- 		{ "l3mon4d3/luasnip" }, -- required
-- 		{ "rafamadriz/friendly-snippets" }, -- optional
-- 	},
-- 	config = function()
-- 		local lsp_zero = require("lsp-zero")
--
-- 		lsp_zero.on_attach(function(client, bufnr)
-- 			local opts = { buffer = bufnr, remap = false }
--
-- 			vim.keymap.set("n", "gd", function()
-- 				vim.lsp.buf.definition()
-- 			end, opts)
-- 			vim.keymap.set("n", "K", function()
-- 				vim.lsp.buf.hover()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vws", function()
-- 				vim.lsp.buf.workspace_symbol()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vd", function()
-- 				vim.diagnostic.open_float()
-- 			end, opts)
-- 			vim.keymap.set("n", "[d", function()
-- 				vim.diagnostic.goto_next()
-- 			end, opts)
-- 			vim.keymap.set("n", "]d", function()
-- 				vim.diagnostic.goto_prev()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vca", function()
-- 				vim.lsp.buf.code_action()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vrr", function()
-- 				vim.lsp.buf.references()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vrn", function()
-- 				vim.lsp.buf.rename()
-- 			end, opts)
-- 			vim.keymap.set("i", "<C-h>", function()
-- 				vim.lsp.buf.signature_help()
-- 			end, opts)
-- 		end)
--
-- 		require("mason").setup({})
-- 		require("mason-lspconfig").setup({
-- 			ensure_installed = { "tsserver", "rust_analyzer" },
-- 			handlers = {
-- 				lsp_zero.default_setup,
-- 				lua_ls = function()
-- 					local lua_opts = lsp_zero.nvim_lua_ls()
-- 					require("lspconfig").lua_ls.setup(lua_opts)
-- 				end,
-- 			},
-- 		})
--
-- 		local cmp = require("cmp")
-- 		local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- 		cmp.setup({
-- 			sources = {
-- 				{ name = "path" },
-- 				{ name = "nvim_lsp" },
-- 				{ name = "nvim_lua" },
-- 				{ name = "luasnip", keyword_length = 2 },
-- 				{ name = "buffer", keyword_length = 3 },
-- 			},
-- 			formatting = lsp_zero.cmp_format(),
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 				["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 				["<C-Space>"] = cmp.mapping.complete(),
-- 			}),
-- 		})
-- 	end,
-- }

------- ********************* v1.x setup ***************** -------------
-- return {
-- 	"VonHeikemen/lsp-zero.nvim",
-- 	branch = "v1.x",
-- 	dependencies = {
-- 		-- LSP Support
-- 		{ "neovim/nvim-lspconfig" }, -- Required
-- 		{ "williamboman/mason.nvim" }, -- Optional
-- 		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
--
-- 		-- Autocompletion
-- 		{ "hrsh7th/nvim-cmp" }, -- Required
-- 		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
-- 		{ "hrsh7th/cmp-buffer" }, -- Optional
-- 		{ "hrsh7th/cmp-path" }, -- Optional
-- 		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
-- 		{ "hrsh7th/cmp-nvim-lua" }, -- Optional
--
-- 		-- Snippets
-- 		{ "L3MON4D3/LuaSnip" }, -- Required
-- 		{ "rafamadriz/friendly-snippets" }, -- Optional
-- 	},
-- 	config = function()
-- 		local status_ok, lsp = pcall(require, "lsp-zero")
-- 		if not status_ok then
-- 			return
-- 		end
--
-- 		lsp.preset({
-- 			name = "minimal",
-- 			set_lsp_keymaps = true,
-- 			manage_nvim_cmp = true,
-- 			suggest_lsp_servers = false,
-- 		})
--
-- 		-- lsp.ensure_installed({
-- 		-- 	"tsserver",
-- 		-- 	"rust_analyzer",
-- 		-- 	"eslint",
-- 		-- })
--
-- 		-- Fix Undefined global 'vim'
-- 		lsp.configure("lua_ls", {
-- 			--
-- 			settings = {
-- 				Lua = {
-- 					diagnostics = {
-- 						globals = { "vim" },
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		local cmp = require("cmp")
-- 		local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- 		local cmp_mappings = lsp.defaults.cmp_mappings({
-- 			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 			["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 			["<C-Space>"] = cmp.mapping.complete(),
-- 		})
--
-- 		cmp_mappings["<Tab>"] = nil
-- 		cmp_mappings["<S-Tab>"] = nil
--
-- 		lsp.setup_nvim_cmp({
-- 			mapping = cmp_mappings,
-- 		})
--
-- 		lsp.on_attach(function(_, bufnr)
-- 			local opts = { buffer = bufnr, remap = false }
--
-- 			vim.keymap.set("n", "gd", function()
-- 				vim.lsp.buf.definition()
-- 			end, opts)
-- 			vim.keymap.set("n", "K", function()
-- 				vim.lsp.buf.hover()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vws", function()
-- 				vim.lsp.buf.workspace_symbol()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vd", function()
-- 				vim.diagnostic.open_float()
-- 			end, opts)
-- 			vim.keymap.set("n", "[d", function()
-- 				vim.diagnostic.goto_next()
-- 			end, opts)
-- 			vim.keymap.set("n", "]d", function()
-- 				vim.diagnostic.goto_prev()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vca", function()
-- 				vim.lsp.buf.code_action()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vrr", function()
-- 				vim.lsp.buf.references()
-- 			end, opts)
-- 			vim.keymap.set("n", "<leader>vrn", function()
-- 				vim.lsp.buf.rename()
-- 			end, opts)
-- 			vim.keymap.set("i", "<C-h>", function()
-- 				vim.lsp.buf.signature_help()
-- 			end, opts)
-- 		end)
--
-- 		lsp.setup()
-- 		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
--
-- 		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "LspDiagnosticsDefaultWarning" })
--
-- 		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "LspDiagnosticsDefaultInformation" })
--
-- 		vim.fn.sign_define("DiagnosticSignHint", { text = "󱧢", texthl = "LspDiagnosticsDefaultHint" })
-- 		vim.diagnostic.config({
-- 			virtual_text = false,
-- 			signs = true,
-- 			update_in_insert = false,
-- 			underline = true,
-- 			severity_sort = true,
-- 			float = true,
-- 		})
-- 		vim.o.updatetime = 250
-- 		vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- 	end,
-- }
--
