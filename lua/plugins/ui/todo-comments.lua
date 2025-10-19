return {
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "LazyFile",
        opts = {
            keywords = {
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                -- NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                -- TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            merge_keywords = false,
        },
        keys = {
            {
                "[t",
                function() require("todo-comments").jump_prev() end,
                desc = "Previous Todo Comment",
            },
            {
                "]t",
                function() require("todo-comments").jump_next() end,
                desc = "Next Todo Comment",
            },

            {
                "<leader>st",
                function() Snacks.picker.todo_comments() end,
                desc = "Todo Comments",
            },
        },
    },
}
