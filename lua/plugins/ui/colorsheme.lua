return {
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavor = "mocha",
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
