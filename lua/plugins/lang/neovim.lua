return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },

    {
        "saghen/blink.cmp",
        optional = true,
        sources = {
            default = { "lazydev" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100, -- show at a higher priority than lsp
                },
            },
        },
    },
}
