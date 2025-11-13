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
                { "<leader>i", group = "Lsp", icon = { icon = " ", color = "cyan" } },
                { "<leader>l", group = "Trouble", icon = " " },
                { "<leader>n", group = "Notification" },
                { "<leader>o", group = "Opencode", icon = "󰚩 " },
                { "<leader>s", group = "Search" },
                { "<leader>t", group = "Test", icon = " " },
                { "<leader>u", group = "UI" },
                { "<leader>w", group = "Wtf", icon = { icon = "󱄶 ", color = "red" } },

                { "ga", group = "Change text case" },
                { "gs", group = "Surround" },
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
