return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<M-f>",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "formatter: Format buffer",
            },
        },

        ---@module "conform"
        ---@type conform.setupOpts
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = { timeout_ms = 500 },
            formatters_by_ft = {
                lua = { "stylua" },
            },
            formatters = {
                stylua = { prepend_args = { "--indent-type", "Spaces" } },
            },
        },

        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
