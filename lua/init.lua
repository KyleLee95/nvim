local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local modules = { "autocmds", "options", "keymaps" }

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	spec = { { {
		import = "plugins",
	} } },
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
		version = nil,
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	install = {
		-- install missing plugins on startup
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "blue", "rose-pine" },
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		-- get a notification when new updates are found
		-- disable it as it's too annoying
		notify = false,
		-- check for updates every day
		frequency = 86400,
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		-- get a notification when changes are found
		-- disable it as it's too annoying
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
})

-- neovide config
-- if vim.g.neovide then
-- 	-- Put anything you want to happen only in Neovide here
-- 	local alpha = function()
-- 		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
-- 	end
-- 	-- g:neovide_tra
-- 	vim.g.neovide_transparency = 0.0
-- 	vim.g.transparency = 0.8
-- 	vim.g.neovide_background_color = "#0f1117" .. alpha()
-- 	vim.g.neovide_window_blurred = true
-- end
