return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            display = {
                action_palette = {
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
            { "<M-'>", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle AI Chat Panel" },
            { "<leader>sa", "<cmd>CodeCompanionActions<CR>", desc = "AI actions" },
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
            filetypes = {
                yaml = true,
            },
        },
    },
    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "fang2hou/blink-copilot" },
        opts = function(_, opts)
            require("utils.blink").add_source(opts, "copilot", {
                name = "copilot",
                module = "blink-copilot",
                score_offset = 100,
                async = true,
            })
        end,
    },
}
