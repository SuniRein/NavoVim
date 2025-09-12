return {
    {
        "mrjones2014/smart-splits.nvim",
        build = "./kitty/install-kittens.bash",
        config = function()
            require("smart-splits").setup({})

            local ss = require("smart-splits")
            local map = vim.keymap.set

            map("n", "<M-S-h>", ss.resize_left, { desc = "Window resize left" })
            map("n", "<M-S-j>", ss.resize_down, { desc = "Window resize down" })
            map("n", "<M-S-k>", ss.resize_up, { desc = "Window resize up" })
            map("n", "<M-S-l>", ss.resize_right, { desc = "Window resize right" })

            map("n", "<C-S-h>", ss.move_cursor_left, { desc = "Window move left" })
            map("n", "<C-S-j>", ss.move_cursor_down, { desc = "Window move down" })
            map("n", "<C-S-k>", ss.move_cursor_up, { desc = "Window move up" })
            map("n", "<C-S-l>", ss.move_cursor_right, { desc = "Window move right" })
        end,
    },
}
