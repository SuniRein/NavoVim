return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            adapter = {
                opts = {
                    -- proxy
                    allow_insecure = true,
                    proxy = "socks5://127.0.0.1:7890",
                },
            },
            display = {
                action_palette = {
                    provider = "telescope",
                    opts = {
                        show_default_actions = true,
                        show_default_prompt_library = true,
                    },
                },
            },
            strategies = {
                chat = { adapter = "copilot" },
                inline = { adapter = "copilot" },
            },
            opts = {
                language = "Chinese",
            },
        },
        keys = {
            { "<M-'>", "<cmd>CodeCompanionChat Toggle<CR>", desc = "ai: Toggle chat panel" },
            { "<leader>fa", "<cmd>CodeCompanionActions<CR>", desc = "telescope: AI actions" },
        },
        cmd = {
            "CodeCompanion",
            "CodeCompanionCmd",
            "CodeCompanionChat",
            "CodeCompanionActions",
        },
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "copilot.lua" },
        opts = {},
    },
}
