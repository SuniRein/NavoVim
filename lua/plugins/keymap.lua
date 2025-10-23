return {
    {
        "folke/which-key.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts_extend = { "spec" },
        ---@module "which-key"
        ---@type wk.Config
        ---@diagnostic disable: missing-fields
        opts = {
            preset = "modern",
            spec = {
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Current", icon = " " },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>n", group = "Notification" },
                { "<leader>s", group = "Search" },
                { "<leader>t", group = "Test", icon = " " },
                { "<leader>u", group = "UI" },
                { "<leader>l", group = "Trouble", icon = " " },
                { "<leader>i", group = "Lsp", icon = { icon = " ", color = "cyan" } },
                { "<leader>w", group = "Wtf", icon = { icon = "󱄶 ", color = "red" } },

                { "gs", group = "Surround" },
                { "ga", group = "Change text case" },
            },
        },
        keys = {
            {
                "<leader>?",
                function() require("which-key").show() end,
                desc = "All Keymaps",
            },
        },
    },
}
