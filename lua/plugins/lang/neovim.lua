return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
            },
        },
    },

    {
        "saghen/blink.cmp",
        optional = true,
        opts = function(_, opts)
            require("utils.blink").add_source(opts, "lazydev", {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100, -- show at a higher priority than lsp
            })
        end,
    },
}
