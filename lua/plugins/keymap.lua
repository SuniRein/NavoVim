return {
    {
        "folke/which-key.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts_extend = { "spec" },
        opts = {
            preset = "modern",
            spec = {
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Current" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>n", group = "Notification" },
                { "<leader>s", group = "Search" },
                { "<leader>t", group = "Test" },
                { "<leader>u", group = "UI" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show()
                end,
                desc = "All Keymaps",
            },
        },
    },
}
