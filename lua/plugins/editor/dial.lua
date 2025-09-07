return {
    {
        "monaqa/dial.nvim",
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:on_filetype({
                rust = {
                    augend.constant.new({
                        elements = { "let mut", "let" },
                    }),
                },
            })

            local function manipulate(direction, mode)
                return function()
                    require("dial.map").manipulate(direction, mode)
                end
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
