return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "single",
                icons = {
                    package_pending = "",
                    package_installed = "󰄳",
                    package_uninstalled = "󰊠",
                },
            },
        },
    },

    -- beatuiful inline diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000, -- needs to be loaded in first
        init = function()
            vim.diagnostic.config({ virtual_text = false })
        end,
        opts = {},
    },
}
