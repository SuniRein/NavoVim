return {
    {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
        },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {
                provider = {
                    cmd = vim.fn.exepath("opencode"),
                    enabled = "kitty",
                },
            }

            vim.o.autoread = true

            vim.keymap.set(
                { "n", "x" },
                "<leader>oa",
                function() require("opencode").ask("@this: ", { submit = true }) end,
                { desc = "Ask opencode" }
            )
            vim.keymap.set(
                { "n", "x" },
                "<leader>ox",
                function() require("opencode").select() end,
                { desc = "Execute opencode action…" }
            )
            vim.keymap.set(
                { "n", "x" },
                "<leader>oA",
                function() require("opencode").prompt("@this") end,
                { desc = "Add to opencode" }
            )
            vim.keymap.set(
                { "n", "t" },
                "<M-.>",
                function() require("opencode").toggle() end,
                { desc = "Toggle opencode" }
            )
        end,
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
