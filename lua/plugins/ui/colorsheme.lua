return {
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            background = { light = "latte", dark = "mocha" }, -- latte, frappe, macchiato, mocha
            highlight_overrides = {
                ---@param cp palette
                all = function(cp)
                    return {
                        -- For nvim-cmp
                        Pmenu = { fg = cp.overlay2, bg = cp.base },
                        PmenuBorder = { fg = cp.surface1, bg = cp.base },
                        PmenuSel = { bg = cp.green, fg = cp.base },
                        CmpItemAbbr = { fg = cp.overlay2 },
                        CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
                        CmpDoc = { link = "NormalFloat" },
                        CmpDocBorder = {
                            fg = cp.mantle,
                            bg = cp.mantle,
                        },
                    }
                end,
            },
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
