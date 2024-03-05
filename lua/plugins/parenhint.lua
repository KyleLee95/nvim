return {
    "briangwaltney/paren-hint.nvim",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("paren-hint")
    end,
}
