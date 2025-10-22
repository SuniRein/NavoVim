local function js_ts_config()
    local augend = require("dial.augend")
    return {
        augend.constant.new({
            elements = { "let", "const" },
        }),
        augend.constant.new({
            elements = { "null", "undefined" },
        }),
    }
end

return {
    {
        "monaqa/dial.nvim",
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.constant.new({ elements = { "and", "or" }, word = true, cyclic = true }),
                    augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
                },
            })
            require("dial.config").augends:on_filetype({
                rust = {
                    augend.constant.new({
                        elements = { "let mut", "let" },
                    }),
                },

                javascript = js_ts_config(),
                typescript = js_ts_config(),
                javascriptreact = js_ts_config(),
                typescriptreact = js_ts_config(),
                vue = js_ts_config(),
            })

            local function manipulate(direction, mode)
                return function() require("dial.map").manipulate(direction, mode) end
            end

            vim.keymap.set("n", "<M-a>", manipulate("increment", "normal"))
            vim.keymap.set("n", "<M-x>", manipulate("decrement", "normal"))

            vim.keymap.set("n", "g<M-a>", manipulate("increment", "gnormal"))
            vim.keymap.set("n", "g<M-x>", manipulate("decrement", "gnormal"))

            vim.keymap.set("x", "<M-a>", manipulate("increment", "visual"))
            vim.keymap.set("x", "<M-x>", manipulate("decrement", "visual"))

            vim.keymap.set("x", "g<M-a>", manipulate("increment", "gvisual"))
            vim.keymap.set("x", "g<M-x>", manipulate("decrement", "gvisual"))
        end,
        keys = {
            "<M-a>",
            "<M-x>",
            "g<M-a>",
            "g<M-x>",
        },
    },
}
