return {
    "m4xshen/autoclose.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        keys = {
            ["("] = { escape = false, close = true, pair = "()" },
            ["["] = { escape = false, close = true, pair = "[]" },
            ["{"] = { escape = false, close = true, pair = "{}" },
            ["<"] = { escape = true, close = true, pair = "<>", enabled_filetypes = { "rust" } },

            [">"] = { escape = true, close = false, pair = "<>" },
            [")"] = { escape = true, close = false, pair = "()" },
            ["]"] = { escape = true, close = false, pair = "[]" },
            ["}"] = { escape = true, close = false, pair = "{}" },

            ['"'] = { escape = true, close = true, pair = '""' },
            ["'"] = {
                escape = true,
                close = true,
                pair = "''",
                disabled_filetypes = { "rust", "verilog", "systemverilog" },
            },
            ["`"] = { escape = false, close = true, pair = "``" },

            ["$"] = { escape = false, close = true, pair = "$$", enabled_filetypes = { "markdown", "latex", "typst" } },
        },

        options = {
            pair_spaces = true,
        },
    },
}
