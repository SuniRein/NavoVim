return {
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            background = { light = "latte", dark = "mocha" }, -- latte, frappe, macchiato, mocha
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
