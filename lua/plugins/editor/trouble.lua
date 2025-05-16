return {
    {
        "folke/trouble.nvim",
        ---@module "trouble"
        ---@class trouble.Config
        opts = {
            icons = {
                indent = {
                    last = "╰╴",
                },
            },
        },
        specs = {
            "folke/snacks.nvim",
            opts = function(_, opts)
                return vim.tbl_deep_extend("force", opts or {}, {
                    picker = {
                        actions = require("trouble.sources.snacks").actions,
                        win = {
                            input = {
                                keys = {
                                    ["<c-t>"] = { "trouble_open", mode = { "n", "i" } },
                                },
                            },
                        },
                    },
                })
            end,
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>ld",
                "<cmd>Trouble diagnostics toggle<CR>",
                desc = "Diagnostics",
            },
            {
                "<leader>lD",
                "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                desc = "Diagnostics (Buffer)",
            },
            {
                "<leader>le",
                "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>",
                desc = "Diagnostics Error",
            },
            {
                "<leader>ll",
                "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
                desc = "LSP Definitions / References / ...",
            },
            {
                "<leader>lL",
                "<cmd>Trouble loclist toggle<CR>",
                desc = "Location List",
            },
            {
                "<leader>lq",
                "<cmd>Trouble qflist toggle<CR>",
                desc = "Quickfix List",
            },
            {
                "<leader>lt",
                "<cmd>Trouble todo toggle<CR>",
                desc = "Todo List",
            },
            {
                "<leader>ls",
                "<cmd>Trouble snacks toggle<CR>",
                desc = "Last Snacks Result",
            },
        },
    },
}
