return {
    {
        "rainbowhxch/accelerated-jk.nvim",
        opts = {},
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)", desc = "accelerated j" },
            { "k", "<Plug>(accelerated_jk_gk)", desc = "accelerated k" },
        },
    },

    {
        "karb94/neoscroll.nvim",
        event = "LazyFile",
        opts = {},
    },

    {
        "sphamba/smear-cursor.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        event = "VeryLazy",
        opts = function()
            local smear_cursor = require("smear_cursor")

            Snacks.toggle({
                name = "Smear Cursor",
                get = function() return smear_cursor.enabled end,
                set = function(state) smear_cursor.enabled = state end,
            }):map("<leader>uS")
        end,
    },
}
