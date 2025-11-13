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
            prompt_library = {
                ["Generate a Commit Message"] = {
                    prompts = {
                        {
                            role = "user",
                            content = function()
                                local diff = vim.system({ "git", "diff", "--no-ext-diff", "--staged" }, { text = true })
                                    :wait()
                                return string.format(
                                    [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me. Write the commit message in English.

````diff
%s
````
]],
                                    diff.stdout
                                )
                            end,
                            opts = {
                                contains_code = true,
                            },
                        },
                    },
                },
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
                opts = {
                    kind_icon = "", -- remove extra gap
                },
            })
        end,
    },

    {
        "piersolenski/wtf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "folke/snacks.nvim",
        },
        opts = {
            provider = "copilot",
            language = "chinese",
            search_engine = "google",
            picker = "snacks",
        },
        keys = {
            {
                "<leader>wd",
                mode = { "n", "x" },
                function() require("wtf").diagnose() end,
                desc = "Debug diagnostic with AI",
            },
            {
                "<leader>wf",
                mode = { "n", "x" },
                function() require("wtf").fix() end,
                desc = "Fix diagnostic with AI",
            },
            {
                mode = { "n" },
                "<leader>ws",
                function() require("wtf").search() end,
                desc = "Search diagnostic with Google",
            },
            {
                mode = { "n" },
                "<leader>wp",
                function() require("wtf").pick_provider() end,
                desc = "Pick provider",
            },
            {
                mode = { "n" },
                "<leader>wh",
                function() require("wtf").history() end,
                desc = "Populate the quickfix list with previous chat history",
            },
            {
                mode = { "n" },
                "<leader>wg",
                function() require("wtf").grep_history() end,
                desc = "Grep previous chat history with snacks.picker",
            },
        },
    },
}
