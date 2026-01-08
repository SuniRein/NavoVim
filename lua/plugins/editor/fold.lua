return {
    {
        "chrisgrieser/nvim-origami",
        event = "VeryLazy",
        config = function()
            require("origami").setup({
                foldKeymaps = { setup = false },
            })

            vim.keymap.set("n", "h", function() require("origami").h() end)
            vim.keymap.set("n", "l", function() require("origami").l() end)
            vim.keymap.set("n", "H", function() require("origami").caret() end)
            vim.keymap.set("n", "L", function() require("origami").dollar() end)
        end,

        -- disable vim's auto-folding
        init = function()
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
        end,
    },
}
